import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WTextFormField extends StatelessWidget {
  const WTextFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

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
        TextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
          onChanged: onChanged,
          validator: validator,
        )
      ],
    );
  }
}
