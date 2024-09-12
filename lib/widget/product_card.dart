import 'package:flutter/material.dart';
import 'package:klontong/model/product.dart';
import 'package:klontong/screen/detail_screen.dart';

import '../util/localization_utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.product,
  });
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: product == null
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    product: product!,
                  ),
                ),
              );
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
                        product?.image ??
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
                product?.name ?? "Ciki-ciki",
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
                product?.description ?? "Ciki Enak",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                LocalizationUtils.formatRp(product?.harga ?? 10000),
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
  }
}
