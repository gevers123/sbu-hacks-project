import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class Asteroid {
  final int id;
  final String name;

  Asteroid({
    required this.id,
    required this.name,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    return Asteroid(
      id: json['id'],
      name: json['name'],
    );
  }
}

Future<Asteroid> fetchAsteroid() async {
  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY'));

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
