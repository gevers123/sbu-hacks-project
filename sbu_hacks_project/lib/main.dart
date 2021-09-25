import 'package:flutter/material.dart';
import 'package:sbu_hacks_project/screens/home.dart';
import 'package:sbu_hacks_project/widgets/asteroid.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Asteroid> futureAsteroid;

  @override
  void initState() {
    super.initState();
    futureAsteroid = fetchAsteroid();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(futureAsteroid),
    );
  }
}
