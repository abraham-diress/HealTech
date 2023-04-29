import 'package:flutter/material.dart';

import 'components/body.dart';

class DoctorScreen extends StatelessWidget {
  static String routeName = "/doctor_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}