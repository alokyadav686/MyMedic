import 'package:flutter/material.dart';
import 'package:my_medic/components/name_header_without_chatbot.dart';

class PaymentScreen extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String fee;
  final String appointmentDate;
  final String appointmentTime;

  const PaymentScreen({
    required this.doctorName,
    required this.specialization,
    required this.fee,
    required this.appointmentDate,
    required this.appointmentTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: NameHeaderWithoutChatbot(),
  ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Complete Your Payment",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 4),
                  Center(
                    child: Text(
                      "Pay securely using UPI",
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Consultation Fee",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "$doctorName - $specialization",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 20),
                            SizedBox(width: 6),
                            Text("Appointment Date: $appointmentDate"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 20),
                            SizedBox(width: 6),
                            Text("Appointment Time: $appointmentTime"),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          fee,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Enter UPI ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "username@upi",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Example: username@upi",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock, color: Colors.green),
                          SizedBox(width: 6),
                          Text("Secure Payment"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.payment, color: Colors.green),
                          SizedBox(width: 6),
                          Text("UPI Payment"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 6,
                      ),
                      onPressed: () {
                        // Handle UPI Payment Logic Here
                      },
                      child: Text("Pay Now", style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
