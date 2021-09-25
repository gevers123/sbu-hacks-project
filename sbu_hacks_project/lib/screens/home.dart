import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
      ),
    );
  }
}
