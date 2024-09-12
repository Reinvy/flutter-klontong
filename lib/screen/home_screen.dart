import 'package:flutter/material.dart';
import 'package:klontong/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widget/product_card.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchC = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Klontong",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              controller: searchC,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
              onChanged: (value) {
                Provider.of<ProductProvider>(
                  context,
                  listen: false,
                ).searchProducts(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<ProductProvider>(builder: (context, productP, _) {
              if (productP.productState == ProductState.success) {
                final products = productP.displayProducts;
                if (products.isEmpty) {
                  return const Center(
                    child: Text("Data Kosong"),
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (searchC.text.isNotEmpty) {
                      return true;
                    }
                    if (notification is ScrollEndNotification &&
                        notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                      productP.pageSize = productP.pageSize + 10;
                    }
                    return true;
                  },
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ).copyWith(bottom: 80),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      mainAxisExtent: 240,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: products[index],
                      );
                    },
                    itemCount: products.length,
                  ),
                );
              }
              return Skeletonizer(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ).copyWith(bottom: 80),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                  itemCount: 6,
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
