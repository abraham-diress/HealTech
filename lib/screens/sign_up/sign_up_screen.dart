import 'package:flutter/material.dart';
import 'sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign Up'),
          onPressed: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
        ),
      ),
    );
  }
}
