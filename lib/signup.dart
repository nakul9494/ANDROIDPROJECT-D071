import 'package:flutter/material.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = '';
  String gender = '';
  int age = 0;
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool accountCreated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Colors.yellow[400], // Set background color to dark blue
      body: accountCreated
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account Created Successfully!!!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                  'Proceed to login',
                  style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      )
          : Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Name'),

            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Gender'),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Age'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Phone'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(labelText: 'Enter Password'),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (password == confirmPassword) {
                  setState(() {
                    accountCreated = true;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Passwords do not match.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 30), // Set font size of the button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
