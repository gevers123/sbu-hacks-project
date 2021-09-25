import 'package:flutter/material.dart';
import 'package:sbu_hacks_project/widgets/asteroid.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  Future<Asteroid> futureAsteroid;
  HomeScreen(Future<Asteroid> futureAsteroid) {
    late futureAsteroid = this.futureAsteroid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.purple[400],
        ),
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
        ));
  }
}
