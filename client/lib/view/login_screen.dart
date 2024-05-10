import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'jojo_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  Future<void> login(BuildContext context) async {
    const apiUrl = 'http://localhost:8080/auth/login';
    final userData = {
      "email": usernameController.text,
      "password": passwordController.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      // Login successful, handle response accordingly
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', usernameController.text);

      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success'),
          content: const Text('User logged in successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Login failed, show error message
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to log in.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      drawer: const JoJoDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () => login(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
