import 'package:flutter/material.dart';
import 'package:client/services/api_service.dart';
import 'package:client/model/user.dart';
import '../app_styles.dart'; // Import the app styles

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService(baseUrl: 'http://localhost:8080');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue, // Set the app bar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName('/')); // Navigate back to main screen
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  User user = await apiService.registerUser(emailController.text, passwordController.text);
                  // Handle successful registration, store accessToken in secure storage
                } catch (e) {
                  // Handle registration error
                  print('Registration failed: $e');
                }
              },
              style: AppStyles.elevatedButtonStyle(context),
              child: Text('Register', style: AppStyles.textStyle),
            ),
          ],
        ),
      ),
    );
  }
}