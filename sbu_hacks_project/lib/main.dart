import 'package:flutter/material.dart';
import 'package:sbu_hacks_project/screens/home.dart';
import 'package:sbu_hacks_project/screens/loading.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
