import 'package:flutter/material.dart';
import 'package:my_medic/components/name_header.dart';
import 'package:my_medic/constants/colors.dart';
import 'package:my_medic/instant_checkup/instant_checkup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: NameHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Your\nHealth",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Our Priority",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 235, 62, 62),
                  fontSize: 54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Get expert medical recommendations and instant checkups at your fingertips.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.textColorgrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HealthCheckupForm()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      "Get Instant\nCheckup",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      "Book a\nVideo Call",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Why You Choose",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColorgrey,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "MyMedic?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "We're committed to providing the best healthcare experience through our platform. Here's what makes us different:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColorgrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  InfoCard(
                    icon: Icons.verified,
                    title: 'Trusted Care',
                    description:
                        'Our platform ensures secure and reliable healthcare services with verified professionals.',
                  ),
                  InfoCard(
                    icon: Icons.access_time,
                    title: '24/7 Support',
                    description:
                        'Access medical assistance anytime with our round-the-clock customer support.',
                  ),
                  InfoCard(
                    icon: Icons.group,
                    title: 'Expert Doctors',
                    description:
                        'Connect with experienced healthcare professionals across various specialties.',
                  ),
                  InfoCard(
                    icon: Icons.star,
                    title: 'Quality Service',
                    description:
                        'We maintain high standards of healthcare delivery and patient satisfaction.',
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                "Powerful Features",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Experience healthcare like never before with our innovative features designed to make your health journey seamless.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColorgrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 30),

              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  FeatureCard(
                    image: 'assets/images/health_monitoring.png',
                    title: 'Health Monitoring',
                    description:
                        "Track your vital signs and health metrics in real-time with our advanced monitoring system.",
                  ),
                  FeatureCard(
                    image: 'assets/images/virtual_consultation.png',
                    title: 'Virtual Consultations',
                    description:
                        'Connect with healthcare providers through secure video consultations from anywhere.',
                  ),
                  FeatureCard(
                    image: 'assets/images/personalized_care.png',
                    title: 'Personalized Care',
                    description:
                        'Receive tailored healthcare recommendations based on your medical history and needs.',
                  ),
                  FeatureCard(
                    image: 'assets/images/ai_powered_insights.png',
                    title: 'AI-Powered Insights',
                    description:
                        'Benefit from intelligent health insights and early warning systems powered by AI.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green, size: 40),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 40),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
