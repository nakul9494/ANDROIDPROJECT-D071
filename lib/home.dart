import 'package:flutter/material.dart';
import 'login.dart'; // Import login page
import 'signup.dart'; // Import signup page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      backgroundColor: Colors.blue[900], // Set background color to dark blue
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align buttons to the top
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // Align buttons to the left
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50), // Set minimum size of the button
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20), // Set font size of the button text
                  ),
                ),
                SizedBox(height: 25), // Add SizedBox with height 25 between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()), // Navigate to signup page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50), // Set minimum size of the button
                  ),
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 20), // Set font size of the button text
                  ),
                ),
              ],
            ),
            Expanded( // Use Expanded to allow the image to take remaining space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Align the image to the bottom
                crossAxisAlignment: CrossAxisAlignment.center, // Align the image to the right
                children: [



                  Padding(
                    padding: const EdgeInsets.only(right: 20.0), // Add padding to the right side of the image
                    child: Image.asset('images/img1.png'), // Add image to the right side
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
