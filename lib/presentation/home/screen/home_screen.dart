import 'package:flutter/material.dart';

import '../../../util/localization_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Klontong",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                mainAxisExtent: 240,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailView(
                    //       data: products[index],
                    //     ),
                    //   ),
                    // );
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Ciki-ciki",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Ciki Enak",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            LocalizationUtils.formatRp(40000),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
