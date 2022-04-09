// import 'package:book/screens/login_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: prefer_const_constructors

//import 'package:book/screens/login_screen.dart';
import 'package:book/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Email And Password Login',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MaterialApp(
    title: "E-kitab",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: LoginScreen(),
  ));
}
