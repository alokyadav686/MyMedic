import 'package:flutter/material.dart';
import 'package:my_medic/screen/medicines/widgets/carousel_card.dart';
import 'package:my_medic/screen/medicines/widgets/popular_categories.dart';
import 'package:my_medic/screen/medicines/widgets/prescripsion.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  final List<Map<String, String>> categories = const [
    {'image': 'assets/images/ayurveda.png', 'title': 'Nutritional Drinks'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Ayurveda'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Vitamins & Supplement'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Ayurveda'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Healthcare Devices'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Homeopathy'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Diabetes Care'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Diabetes Care'},
  ];
  final List<Map<String, String>> daily = const [
    {'image': 'assets/images/ayurveda.png', 'title': 'Drinks'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Ayurveda'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Vitamins & Supplement'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Ayurveda'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Healthcare Devices'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Homeopathy'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Diabetes Care'},
    {'image': 'assets/images/ayurveda.png', 'title': 'Diabetes Care'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'MEDICINE',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Medicine & Health Products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Prescription(),

            CarouselCard(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'SEE ALL >',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 230, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      image: categories[index]['image']!,
                      title: categories[index]['title']!,
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daily uses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'SEE ALL >',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 230, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      image: daily[index]['image']!,
                      title: daily[index]['title']!,
                    );
                  },
                ),
              ),
            ),
            




          ],
        ),
      ),
    );
  }
}
