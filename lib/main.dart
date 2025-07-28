import 'package:flutter/material.dart';
import 'package:my_medic/services/splash/splash_auth.dart';
import 'package:my_medic/services/splash/splash_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthStorage.init();
  
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splashscreen()));
}
