import 'package:flutter/material.dart';
import 'package:my_medic/login/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_medic/screen/profile/widget/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User";
      userEmail = prefs.getString('userEmail') ?? "user@example.com";
    });
  }

  Future<void> _logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    ); // Navigate to Welcome Screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName, // Display stored name
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          userEmail, // Display stored email
                          style: TextStyle(color: Colors.yellow, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  ProfileMenuItem(icon: Icons.shopping_bag, text: 'My Orders'),
                  const Divider(),
                  ProfileMenuItem(icon: Icons.favorite, text: 'My Wishlist'),
                  const Divider(),
                  ProfileMenuItem(
                    icon: Icons.medical_services,
                    text: 'Doctor Consultation',
                  ),
                  const Divider(),
                  ProfileMenuItem(icon: Icons.payment, text: 'Payment Methods'),
                  const Divider(),
                  ProfileMenuItem(
                    icon: Icons.location_on,
                    text: 'Your Addresses',
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.green),
                        ),
                      ),
                      onPressed: _logout,
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileMenuItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(text, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}
