import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_medic/components/bottom_nav_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_medic/constants/colors.dart';
import 'package:my_medic/onboarding/onboarding.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),

            Text(
              "MyMedic",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
