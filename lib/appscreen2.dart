import 'package:flutter/material.dart';

class AppScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Page'),
      ),
      body: Center(
        child: Text(
          'This is the Health Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
