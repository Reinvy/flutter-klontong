import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/category.dart';
import '../provider/product_provider.dart';
import '../util/service_locator.dart';

class WdropdownButton extends StatelessWidget {
  const WdropdownButton({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.onChanged,
    this.validator,
  });

  final Category? controller;
  final String title;
  final String hintText;
  final void Function(Category?)? onChanged;
  final String? Function(Category?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        DropdownSearch<Category>(
          popupProps: const PopupProps.menu(
            fit: FlexFit.loose,
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              hintText: "Kategori",
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
            ),
          ),
          asyncItems: (text) => sl<ProductProvider>().getCategories(),
          itemAsString: (item) => item.name,
          onChanged: onChanged,
          selectedItem: controller,
          validator: validator,
        ),
      ],
    );
  }
}
