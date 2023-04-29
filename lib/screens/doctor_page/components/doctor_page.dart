import 'package:flutter/material.dart';
import '../models/doctor_model.dart';
export 'doctor_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';



class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}
 

class DoctorList {
  static List<DoctorModel> doctorList = [];
  static List<DoctorModel> displayList = [];

  static Future<void> fetchData() async {
    // Retrieve the doctor data from Firestore
    final  snapshot = await FirebaseFirestore.instance.collection('doctors_info').get();

    // Convert the retrieved data to a list of DoctorModel objects
    final doctors = snapshot.docs.map((doc) => DoctorModel(
          doc['name'],
          doc['speciality'],
          doc['hospital'],
          doc['image'],
          doc['bio'],
          doc['email'],
          doc['infoline'],
          doc['experience'],
          
          
          
          
        )).toList();

    // Update the doctorList with the retrieved data
    doctorList = List<DoctorModel>.from(doctors);
    initializeList();
  }

  static void initializeList() {
    displayList = List.from(doctorList);
  }

  static void updateList(String value) {
    displayList = doctorList
        .where((element) => element.doctorName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}



class MainPageState extends State<MainPage> {
   int selectedIndex = 0;
   @override
  //void initState() {
    //super.initState();
    //DoctorList.fetchData();
  //}

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
      ),

       bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.local_hospital),
        label: 'Hospital',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Doctors',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ],) ,
    );
    
  }
}