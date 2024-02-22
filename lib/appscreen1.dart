import 'package:flutter/material.dart';

class AppScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Health Progress',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(value: 0.7), // Example value
                  SizedBox(height: 16.0),
                  Text(
                    'Workout Progress',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(value: 0.5), // Example value
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'Calories Burned',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 8.0),
                        SizedBox(
                          height: 100.0, // Increase the height of the SizedBox to adjust the circular progress bar size
                          width: 100.0, // Increase the width of the SizedBox to adjust the circular progress bar size
                          child: CircularProgressIndicator(
                            strokeWidth: 10.0, // Increase the strokeWidth to increase the size of the circular progress bar
                            value: 0.3, // Example value
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Step Counter',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '5000 steps', // Example value
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(width: 8.0),
                      SizedBox(
                        height: 100.0, // Increase the height of the SizedBox to adjust the circular progress bar size
                        width: 100.0, // Increase the width of the SizedBox to adjust the circular progress bar size
                        child: CircularProgressIndicator(
                          strokeWidth: 10.0, // Increase the strokeWidth to increase the size of the circular progress bar
                          value: 0.6, // Example value
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            BottomNavigationBar(
              currentIndex: 0, // Home screen index
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.purpleAccent,
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.health_and_safety_outlined),
                  label: 'Health',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center),
                  label: 'Fitness',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AppScreen1(),
    debugShowCheckedModeBanner: false,
  ));
}
