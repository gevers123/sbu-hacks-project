import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sbu_hacks_project/widgets/asteroid.dart';
import 'package:http/http.dart' as http;
import 'package:sbu_hacks_project/widgets/date.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<Asteroid> fetchAsteroid() async {
    Date today = new Date();
    today.setTodaysDate();
    String startDate = today.dateToString();

    final response = await http.get(Uri.parse(
        'https://api.nasa.gov/neo/rest/v1/feed?start_date=' +
            startDate +
            '&api_key=DEMO_KEY'));
    print(startDate);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Asteroid.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load asteroid');
    }
  }

  late Future<Asteroid> futureAsteroid;

  @override
  void initState() {
    super.initState();
    futureAsteroid = fetchAsteroid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Asteroid>(
          future: futureAsteroid,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
