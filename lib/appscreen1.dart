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
              onTap: (index) {
                switch (index) {
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HealthDetailsScreen()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FitnessDetailsScreen()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HealthDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Heart Rate',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              height: 150.0,
              width: 150.0,
              child: CircularProgressIndicator(
                strokeWidth: 15.0,
                value: 0.8, // Example value for heart rate
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class FitnessDetailsScreen extends StatefulWidget {
  @override
  _FitnessDetailsScreenState createState() => _FitnessDetailsScreenState();
}

class _FitnessDetailsScreenState extends State<FitnessDetailsScreen> {
  TextEditingController _exerciseController = TextEditingController();
  TextEditingController _setsController = TextEditingController();
  List<TextEditingController> _repsControllers = [];

  List<ExerciseDetails> _exerciseDetails = [];

  void _createRepsControllers(int numSets) {
    _repsControllers.clear();
    for (int i = 0; i < numSets; i++) {
      _repsControllers.add(TextEditingController());
    }
  }

  void _addExerciseDetails() {
    String exerciseName = _exerciseController.text;
    int numSets = int.tryParse(_setsController.text) ?? 0;
    List<int> reps = [];
    for (TextEditingController controller in _repsControllers) {
      reps.add(int.tryParse(controller.text) ?? 0);
    }

    setState(() {
      _exerciseDetails.add(ExerciseDetails(exerciseName: exerciseName, numSets: numSets, reps: reps));
    });

    _exerciseController.clear();
    _setsController.clear();
    _repsControllers.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _exerciseController,
              decoration: InputDecoration(labelText: 'Exercise Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _setsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of Sets'),
              onChanged: (value) {
                int numSets = int.tryParse(value) ?? 0;
                setState(() {
                  _createRepsControllers(numSets);
                });
              },
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < _repsControllers.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Set ${i + 1}:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextField(
                    controller: _repsControllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Number of Reps'),
                  ),
                  SizedBox(height: 12.0),
                ],
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addExerciseDetails,
              child: Text('Add Exercise Details'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _exerciseDetails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_exerciseDetails[index].exerciseName),
                    subtitle: Text('Sets: ${_exerciseDetails[index].numSets}, Reps: ${_exerciseDetails[index].reps}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _exerciseController.dispose();
    _setsController.dispose();
    for (TextEditingController controller in _repsControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class ExerciseDetails {
  final String exerciseName;
  final int numSets;
  final List<int> reps;

  ExerciseDetails({required this.exerciseName, required this.numSets, required this.reps});
}



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Account Info',
              style: TextStyle(fontSize: 20.0),
            ),
            // Add more widgets for account details as needed
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to home screen
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Logout'),
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
