import 'package:client/app_styles.dart';
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
          _buildButtonWithBorder(
            context,
            'Login',
            '/login',
            Colors.grey // Color for Login button
          ),
          _buildButtonWithBorder(
            context,
            'SignUp',
            '/signup',
            Colors.grey, // Color for SignUp button
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
            title: const Text('Events'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/events');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButtonWithBorder(
    BuildContext context,
    String title,
    String routeName,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Border color
        borderRadius: BorderRadius.circular(10), // Rounded border
        color: color,
      ),
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pushReplacementNamed(context, routeName);
        },
      ),
    );
  }
}
