// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SemScreen extends StatefulWidget {
  const SemScreen({Key? key}) : super(key: key);

  @override
  State<SemScreen> createState() => _SemScreenState();
}

class _SemScreenState extends State<SemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("this is sem1.")));
  }
}
