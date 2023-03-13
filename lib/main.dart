import 'package:flutter/material.dart';
import 'package:mini_project_mob_dev/routes.dart';
import 'package:mini_project_mob_dev/screens/sign_in/componenets/sign_in_form.dart';
import 'package:mini_project_mob_dev/screens/splash/splash_screen.dart';
import 'package:mini_project_mob_dev/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp() ;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
  
}
 class MainPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return Home();
        } else {
          return SignForm();
        }
      }
    ),
  );
 }