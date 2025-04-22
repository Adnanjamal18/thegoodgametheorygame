import 'dart:async';
import 'package:esp32test/screens/questioncard.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return QuestionCard();
      },));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6B43C2),
      body: Center(
        child: Text(
          'Drag Game',style: TextStyle(
          color: Colors.white,fontSize: 40
        ),
        ),
      ),
    );
  }
}