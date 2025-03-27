import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_medic/constants/colors.dart';
import 'package:my_medic/screen/chatbot/chatbot.dart';

class NameHeader extends StatefulWidget {
  const NameHeader({super.key});

  @override
  _NameHeaderState createState() => _NameHeaderState();
}

class _NameHeaderState extends State<NameHeader> {
  String userName = "User"; // Default name

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  // Fetch user name from SharedPreferences
  Future<void> _loadUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User"; // Retrieve stored name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                child: Image.asset("assets/images/logo.png", fit: BoxFit.fill),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, $userName 🖐", // Dynamically show user name
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "How is your health!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatBotApp()),
              );
            },
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/images/helpdesk.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
