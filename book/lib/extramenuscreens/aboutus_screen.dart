// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Kusal Shrestha, Umesh Rai, Vivek Kaliraj, Sandesh Pandit"),
      ),
    );
  }
}
