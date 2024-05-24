import 'package:client/app_styles.dart';
import 'package:flutter/material.dart';

class JoJoDrawer extends StatelessWidget {
  const JoJoDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(194, 0, 251, .5),
            ),
            child: Image(image: AssetImage('assets/images/JoJo.png')),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text('Login', style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 25, // Уменьшенные отступы
            endIndent: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text('SignUp', style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 25, // Уменьшенные отступы
            endIndent: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text('Main', style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 25, // Уменьшенные отступы
            endIndent: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text("JoJos", style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfActors');
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 25, // Уменьшенные отступы
            endIndent: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text('Stuff', style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfStuff');
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 25, // Уменьшенные отступы
            endIndent: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text('News', style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listOfNews');
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 25, // Уменьшенные отступы
            endIndent: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0), // Отступы
            title: const Text('Events', style: TextStyle(fontFamily: 'JoJoFont')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/events');
            },
          ),
        ],
      ),
    );
  }
}
