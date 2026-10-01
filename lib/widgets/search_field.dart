import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const SearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          hintText: 'Cari sneakers, brand, model...',
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 19,
            color: Colors.grey.shade500,
          ),
          suffixIcon: IconButton(
            onPressed: onFilterTap,
            icon: const Icon(
              Icons.tune_rounded,
              size: 18,
              color: Colors.grey,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
        ),
      ),
    );
  }
}