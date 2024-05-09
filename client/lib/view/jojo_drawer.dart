import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoJoDrawer extends StatefulWidget {
  const JoJoDrawer({Key? key}) : super(key: key);

  @override
  _JoJoDrawerState createState() => _JoJoDrawerState();
}

class _JoJoDrawerState extends State<JoJoDrawer> {
  String? username;

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all data in SharedPreferences
    Navigator.pushReplacementNamed(context, '/login'); // Navigate back to the login screen
  }

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
            title: const Text('Events'), // Add Events screen option
            onTap: () {
              Navigator.pushReplacementNamed(context, '/events');
            },
          ),
          if (username == null)
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          if (username == null)
            ListTile(
              title: const Text('Register'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/register');
              },
            ),

          if (username != null)
            ListTile(
              title: Text('Logged in as: $username'),
            ),
          if (username != null)
            ListTile(
              title: Text('Logout'),
              onTap: () => logout(context),
            ),
        ],
      ),
    );
  }
}
