import 'package:flutter/material.dart';
import 'package:my_medic/login/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_medic/components/bottom_nav_bar.dart';

class SplashServices {
  Future<void> isLogin(BuildContext context) async {
    try {
      // Ensure SharedPreferences is initialized before use
      await AuthStorage.init();

      bool isAuthenticated = await AuthStorage.getAuthStatus();

      await Future.delayed(Duration(seconds: 2)); // Add delay for splash effect

      if (!context.mounted) return; // Ensure context is valid before navigation

      if (isAuthenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    } catch (e) {
      print("Error: $e");
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  }
}

class AuthStorage {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Save authentication status
  static Future<void> setAuthStatus(bool isAuthenticated) async {
    if (_prefs == null) await init(); // Ensure it's initialized
    await _prefs?.setBool("isAuthenticated", isAuthenticated);
  }

  // Get authentication status
  static Future<bool> getAuthStatus() async {
    if (_prefs == null) await init(); // Ensure it's initialized
    return _prefs?.getBool("isAuthenticated") ?? false;
  }

  // Clear authentication status (for logout)
  static Future<void> clearAuthStatus() async {
    if (_prefs == null) await init(); // Ensure it's initialized
    await _prefs?.remove("isAuthenticated");
  }
}
