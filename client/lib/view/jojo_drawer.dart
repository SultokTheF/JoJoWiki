import 'package:flutter/material.dart';

class JoJoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'JoJo App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Main'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Stuff'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfStuff');
            },
          ),
          ListTile(
            title: Text("JoJo's"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfActors');
            },
          ),
          ListTile(
            title: Text('News'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfNews');
            },
          ),
          ListTile(
            title: Text('Comments'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfComments');
            },
          ),
        ],
      ),
    );
  }
}