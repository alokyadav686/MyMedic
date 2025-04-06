import 'package:flutter/material.dart';
import 'package:my_medic/screen/medicines/widgets/carousel_card.dart';
import 'package:my_medic/screen/medicines/widgets/popular_categories.dart';
import 'package:my_medic/screen/medicines/widgets/prescripsion.dart';
import 'package:my_medic/services/api/api_services.dart' as ApiService;

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  List<dynamic> MedicineLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMedicine();
  }

  Future fetchMedicine() async {
    List<dynamic> data = await ApiService.getMedicine();

    setState(() {
      MedicineLists = data;
    });
  }

  bool seeAll = false;
  bool seeDailyUses = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        seeAll = !seeAll;
                      });
                    },
                    child: Text(
                      seeAll ? 'SEE LESS' : 'SEE ALL >',
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                // height: 230, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount:
                      seeAll
                          ? MedicineLists.length
                          : MedicineLists.length <= 8
                          ? MedicineLists.length
                          : 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final medicine = MedicineLists[index];
                    return CategoryItem(
                      image: medicine['image']!,
                      title: medicine['name']!,
                      price: medicine['price'].toString(),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daily uses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        seeDailyUses = !seeDailyUses;
                      });
                    },
                    child: Text(
                      seeDailyUses ? 'SEE LESS' : 'SEE ALL >',
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                // height: 230, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount:
                      seeDailyUses
                          ? MedicineLists.where(
                            (medicine) =>
                                medicine['category']
                                    ?.toString()
                                    .toLowerCase() ==
                                'daily uses',
                          ).length
                          : MedicineLists.where(
                                (medicine) =>
                                    medicine['category']
                                        ?.toString()
                                        .toLowerCase() ==
                                    'daily uses',
                              ).length <=
                              8
                          ? MedicineLists.where(
                            (medicine) =>
                                medicine['category']
                                    ?.toString()
                                    .toLowerCase() ==
                                'daily uses',
                          ).length
                          : 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final dailyUsesMedicines =
                        MedicineLists.where(
                          (medicine) =>
                              medicine['category']?.toString().toLowerCase() ==
                              'daily uses',
                        ).toList();

                    final medicine = dailyUsesMedicines[index];
                    return CategoryItem(
                      image: medicine['image'].toString(),
                      title: medicine['name']!,
                      price: medicine['price'].toString(),
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
