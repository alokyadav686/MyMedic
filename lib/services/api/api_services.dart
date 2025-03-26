import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

var chatapi ="https://mediconnect-pn3n.onrender.com/medical-chat";


Future getDoctor() async{
String doctors = await rootBundle.loadString('assets/json/doctorsdata.json');

// var doctors = jsonDecode(doctor);

return jsonDecode(doctors);

}

Future chatbot({required Map<String, String> message}) async{
  var chat = await http.post(Uri.parse(chatapi));

  if(chat.statusCode == 200){
    return jsonDecode(chat.body);
  }

}