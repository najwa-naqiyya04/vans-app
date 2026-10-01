import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.black
              : Colors.white,
          borderRadius:
              BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.black
                : Colors.grey.shade200,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected
                ? FontWeight.w700
                : FontWeight.w500,
            color: isSelected
                ? Colors.white
                : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}