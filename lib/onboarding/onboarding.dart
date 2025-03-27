import 'package:flutter/material.dart';
import 'package:my_medic/constants/colors.dart';
import 'package:my_medic/services/splash/splash_auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int key = 0;
  final SplashServices splashServices = SplashServices();

  @override
  Widget build(BuildContext context) {
    final images = [
      "assets/images/ChooseYourDoctor1.png",
      "assets/images/ScheduleYourAppointments1.png",
      "assets/images/CheckYourMedicalHistory1.png",
    ];
    final heading = [
      "Choose Your\nDoctor",
      "Schedule your\nappointments",
      "Online Order of\nMedicine",
    ];
    final titles = [
      "Search for doctors by name, specialization, or location. Book appointments with the best healthcare professionals across India.",
      "Book Your Appointment Today ~ Quick, Easy, and Hassle-Free!",
      "Get Your Medicines Delivered ~ Fast, Safe & Hassle-Free Online Ordering",
    ];
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () async {
                      await splashServices.isLogin(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Illustration Image (Replace with your asset)
                Container(
                  height: screenHeight * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bgsplash.png'),
                    ),
                  ),
                  child: Image.asset(images[key], height: 250),
                ),

                SizedBox(height: screenHeight * 0.05),
                Text(
                  heading[key],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  titles[key],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: screenHeight * 0.025),

                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => buildDot(index == key)),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Next Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (key == 2) {
                        await splashServices.isLogin(context);
                      } else {
                        setState(() {
                          key += 1;
                        });
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      key == 2 ? "Get Started" : "Next",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to create a dot indicator
  Widget buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
 