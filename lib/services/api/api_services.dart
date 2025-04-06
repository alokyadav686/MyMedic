import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

var chatapi = "https://mediconnect-pn3n.onrender.com/medical-chat";

Future getDoctor() async {
  String doctors = await rootBundle.loadString('assets/json/doctorsdata.json');

  return jsonDecode(doctors);
}

Future<String> chatbot({required Map<String, String> message}) async {
  try {
    var response = await http.post(
      Uri.parse(chatapi),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      final bot = jsonDecode(response.body);
      return bot['response'] ?? "I didn't understand that.";
    } else {
      return "Error: Unable to get response.";
    }
  } catch (e) {
    return "Error: ${e.toString()}";
  }
}

var medineApi = "https://mediconnect-pn3n.onrender.com/medicines/list-all";

Future getMedicine() async {
  var medicine = await http.get(Uri.parse(medineApi));

  var MedicineList = jsonDecode(medicine.body);

  if (medicine.statusCode == 200) {
    return MedicineList;
  }
}
