import 'package:flutter/material.dart';
import 'package:my_medic/constants/colors.dart';
import 'package:my_medic/screen/doctors/widget/doctors_card.dart';
import 'package:my_medic/screen/home/widgets/custom_header.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  bool showFilters = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: CustomHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Find a Doctor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Text(
              "Search for doctors by name, specialization, or location. Book appointments with the best healthcare professionals across India.",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            SizedBox(height: 16),

            // Search Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade100, // Light green background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Doctors...",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 28,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ), // Space between search bar and filter button
                // Filter Button
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: 28,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        showFilters = !showFilters; // Toggle filter visibility
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: showFilters,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Categories Dropdown
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isDense: true, // Makes it more compact
                          decoration: InputDecoration(
                            labelText: "Categories",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                          ),
                          items:
                              ["Cardiologist","Physiatrist", "Dermatologist","Sexologist", "Neurologist"]
                                  .map(
                                    (category) => DropdownMenuItem(
                                      value: category,
                                      child: Text(
                                        category,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {},
                        ),
                      ),

                      SizedBox(width: 8), // Space between dropdowns
                      
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isDense: true,
                          decoration: InputDecoration(
                            labelText: "Price",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                          ),
                          items:
                              ["₹500 - ₹1000", "₹1000 - ₹2000", "₹2000+"]
                                  .map(
                                    (price) => DropdownMenuItem(
                                      value: price,
                                      child: Text(
                                        price,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {},
                        ),
                      ),

                      SizedBox(width: 8), // Space between dropdowns
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Doctor List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DoctorsCard(
                      name: 'Dr. Priya Sharma',
                      specialization: 'Cardiologist',
                      rating: '4.8',
                      experience: '9 years',
                      location: 'North West Delhi',
                      price: '₹ 1500',
                    ),
                    SizedBox(height: 20),
                    DoctorsCard(
                      name: 'Dr. Alok Yadav',
                      specialization: 'Cardiologist',
                      rating: '4.8',
                      experience: '9 years',
                      location: 'North West Delhi',
                      price: '₹ 1500',
                    ),
                    SizedBox(height: 20),
                    DoctorsCard(
                      name: 'Dr. Priya Sharma',
                      specialization: 'Cardiologist',
                      rating: '4.8',
                      experience: '9 years',
                      location: 'North West Delhi',
                      price: '₹ 1500',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
