import 'package:flutter/material.dart';

class AppScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Page'),
      ),
      body: Center(
        child: Text(
          'This is the Fitness Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
