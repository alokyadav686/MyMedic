import 'package:flutter/material.dart';
import 'package:my_medic/services/api/api_services.dart' as ApiService;

class HealthCheckupForm extends StatefulWidget {
  @override
  _HealthCheckupFormState createState() => _HealthCheckupFormState();
}

class _HealthCheckupFormState extends State<HealthCheckupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final TextEditingController medicalHistoryController =
      TextEditingController();
  String? selectedGender;
  String? result;

  void assessHealth() async {
    if (!_formKey.currentState!.validate()) return;

    String prompt =
        "I am ${ageController.text} years old and my gender is $selectedGender. My symptoms are: ${symptomsController.text}.";
    if (medicalHistoryController.text.isNotEmpty) {
      prompt +=
          " My medical history includes: ${medicalHistoryController.text}.";
    }

    setState(() {
      result = "Assessing...";
    });

    try {
      String botResponse = await ApiService.chatbot(
        message: {"message": prompt},
      );
      setState(() {
        result = botResponse;
      });
    } catch (e) {
      setState(() {
        result = "Error: Unable to get assessment. Please try again later.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instant Health Checkup'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.health_and_safety,
                  color: Colors.green,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Describe your symptoms and get an instant AI-powered health assessment",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Age*",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      decoration: const InputDecoration(
                        labelText: "Gender*",
                        border: OutlineInputBorder(),
                      ),
                      items:
                          ["Male", "Female", "Other"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? 'Please select a gender' : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: symptomsController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Describe your symptoms*",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please describe your symptoms';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: medicalHistoryController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Medical History (Optional)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: assessHealth,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Get Assessment",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Column(
                        children: [
                          Icon(Icons.info, color: Colors.blue, size: 30),
                          SizedBox(height: 5),
                          Text(
                            "Assessment Results",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (result != null)
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          result ?? 'No result available',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
