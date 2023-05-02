import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:HealTech/screens/sign_in/sign_in_screen.dart';
import 'package:HealTech/screens/hospital/hospital_screen.dart';
import 'package:HealTech/screens/doctor/doctor_screen.dart';
import 'package:HealTech/screens/profile/profile_screen.dart';
import 'dart:math';

class LoginSuccessScreen extends StatefulWidget {
  static String routeName = "/login_success";

  LoginSuccessScreen({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginSuccessScreen createState() => _LoginSuccessScreen();
}

class _LoginSuccessScreen extends State<LoginSuccessScreen> {
  int _selectedIndex = 0;
  final _random = Random();

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DoctorScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Hospital',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
