import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final String? selectedSize;
  final ValueChanged<String> onSizeSelected;

  const SizeSelector({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  static const List<String> sizes = [
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // =========================
        // TITLE
        // =========================

        Row(
          children: [
            const Expanded(
              child: Text(
                'UKURAN (SIZE EU)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Nanti bisa dibuat modal size guide.
              },
              child: Text(
                'Size Guide',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 13),

        // =========================
        // SIZE LIST
        // =========================

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: sizes.map((size) {
            final bool isSelected =
                selectedSize == size;

            return GestureDetector(
              onTap: () {
                onSizeSelected(size);
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 180,
                ),
                width: 52,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.black
                      : Colors.white,
                  borderRadius:
                      BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Colors.black
                        : Colors.grey.shade200,
                  ),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}