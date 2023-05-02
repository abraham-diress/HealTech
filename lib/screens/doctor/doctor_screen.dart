import 'package:flutter/material.dart';
import 'package:HealTech/screens/doctor/components/body.dart';

class DoctorScreen extends StatelessWidget {
  static String routeName = "/doctor_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: Body(),
    );
  }
}
