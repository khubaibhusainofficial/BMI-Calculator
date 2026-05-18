import 'dart:async';
import 'package:bmi_calculator/Utility/UI/Colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Utility/UI/TextStyling.dart';
import '../BottomNavBar/Home.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 4), (a) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
        (_) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/heart.json",
              width: 200,
              height: 200,
              repeat: true,
            ),
            SizedBox(height: 15),
            Text("Know Your Body. Improve Your Lifestyle", style: subtitle),
            SizedBox(height: 45),
            CircularProgressIndicator(color: white, strokeWidth: 3),
          ],
        ),
      ),
    );
  }
}
