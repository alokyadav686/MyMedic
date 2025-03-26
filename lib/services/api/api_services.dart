import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


Future getDoctor() async{
String doctors = await rootBundle.loadString('assets/json/doctorsdata.json');

// var doctors = jsonDecode(doctor);

return jsonDecode(doctors);

}