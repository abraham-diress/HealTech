import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String _errorText = '';

  void _createAccount() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validate input
    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorText = 'Please fill in all fields';
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorText = 'Passwords do not match';
      });
      return;
    }

    // Make API call to register user
    String url = 'https://your-api-endpoint.com/register';
    var response = await http.post(Uri.parse(url), body: {
      'username': username,
      'email': email,
      'password': password
    });

    if (response.statusCode == 200) {
      // User was created successfully, navigate to login screen
      Navigator.pushNamed(context, '/login');
    } else {
      // An error occurred, display error message to user
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _errorText = data['error'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
               
