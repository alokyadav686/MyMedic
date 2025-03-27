import 'package:flutter/material.dart';
import 'package:my_medic/components/bottom_nav_bar.dart';
import 'package:my_medic/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashServices {
  Future<void> isLogin(BuildContext context) async {
    final bool isAuthenticated = await AuthStorage.getAuthStatus();

    if (isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}

class AuthStorage {
  // Save authentication status
  static Future<void> setAuthStatus(bool isAuthenticated) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isAuthenticated", isAuthenticated);
  }

  // Get authentication status
  static Future<bool> getAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isAuthenticated") ?? false; // Default to false
  }

  // Clear authentication status (for logout)
  static Future<void> clearAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("isAuthenticated");
  }
}
