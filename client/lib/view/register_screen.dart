import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'jojo_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});

  Future<void> register(BuildContext context) async {
    const apiUrl = 'http://localhost:8080/auth/register';
    final userData = {
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      // Registration successful, handle response accordingly
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailController.text);
      prefs.setString('username', usernameController.text);

      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success'),
          content: const Text('User registered successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Registration failed, show error message
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to register.'),
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
      appBar: AppBar(title: const Text('Register')),
      drawer: const JoJoDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () => register(context),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}