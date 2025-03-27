import 'package:flutter/material.dart';
import 'package:my_medic/components/name_header.dart';
import 'package:my_medic/screen/doctors/widget/doctors_card.dart';
import 'package:my_medic/services/api/api_services.dart' as ApiService;

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  bool showFilters = false;
  List<dynamic> doctorlist = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDoctors();
  }

  void fetchDoctors() async {
    List<dynamic> data = await ApiService.getDoctor();

    setState(() {
      doctorlist = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: NameHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
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
                SizedBox(width: 10),
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
                              [
                                    "Cardiologist",
                                    "Physiatrist",
                                    "Dermatologist",
                                    "Sexologist",
                                    "Neurologist",
                                  ]
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

            Expanded(
              child:
                  isLoading
                      ? Center(
                        child: CircularProgressIndicator(),
                      ) // Show loader while fetching data
                      : doctorlist.isEmpty
                      ? Center(
                        child: Text("No doctors found"),
                      ) // Show message if no doctors
                      : ListView.builder(
                        itemCount: doctorlist.length,
                        itemBuilder: (context, index) {
                          var doctorData = doctorlist[index];
                          return DoctorsCard(
                            name: doctorData['name'],
                            specialization: doctorData['specialization'],
                            rating: doctorData['rating'].toString(),
                            experience: doctorData['experience'].toString(),
                            location: doctorData['location'],
                            price: doctorData['price'].toString(),
                            image: doctorData['image'].toString(),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
