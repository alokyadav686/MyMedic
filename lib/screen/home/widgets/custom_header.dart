import 'package:flutter/material.dart';
import 'package:my_medic/constants/colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: AppColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                child: Image.asset("assets/images/logo.png", fit: BoxFit.fill),
              ),
              SizedBox(width: 8),
              Text(
                "MyMedic",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              
            },
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset("assets/images/helpdesk.png", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
