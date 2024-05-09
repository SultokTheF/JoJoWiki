import 'package:flutter/material.dart';

class JoJoDrawer extends StatelessWidget {
  const JoJoDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'JoJo Wiki',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'JoJoFont',
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Main'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text("JoJos"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfActors');
            },
          ),
          ListTile(
            title: const Text('Stuff'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfStuff');
            },
          ),
          ListTile(
            title: const Text('News'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfNews');
            },
          ),
          ListTile(
            title: const Text('Login'), // Add Login screen option
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          ListTile(
            title: const Text('Register'), // Add Register screen option
            onTap: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}
