import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/texture2.png"),
                fit: BoxFit.cover,
              ),
            ),

              child: Column(
                children: [
                  // Back Arrow
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: IconButton(color: Colors.white, onPressed: () { 
                        Navigator.pop(context);
                       }, icon: Icon(Icons.arrow_back),),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Profile Picture with Edit Icon
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage('assets/images/logo.png'), // Change the image path
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.edit, color: Colors.black, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileTextField(label: "Name", value: "Alok Yadav"),
                  ProfileTextField(label: "Email", value: "ahir@gmail.com"),
                  ProfileTextField(label: "Age", value: "20"),
                  ProfileTextField(label: "Gender", value: "Male"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Logout Button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Colors.green),
              ),
              onPressed: () {
                Navigator.pop(context);

              },
              child: const Text("Save", style: TextStyle(color: Colors.green, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom TextField Widget
class ProfileTextField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileTextField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextField(
          readOnly: true,
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
