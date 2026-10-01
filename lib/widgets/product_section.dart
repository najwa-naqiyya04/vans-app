import 'package:flutter/material.dart';
import '../models/shoe.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Shoe> shoes;
  final Set<String> favoriteIds;
  final VoidCallback? onSeeAll;
  final Function(Shoe shoe)? onProductTap;
  final Function(Shoe shoe)? onFavoriteTap;

  const ProductSection({
    super.key,
    required this.title,
    required this.shoes,
    this.favoriteIds = const {},
    this.onSeeAll,
    this.onProductTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        GridView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(),
          itemCount: shoes.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 18,
            childAspectRatio: 0.73,
          ),
          itemBuilder: (context, index) {
            final shoe = shoes[index];

            return ProductCard(
              shoe: shoe,
              isFavorite:
                  favoriteIds.contains(shoe.id),
              onTap: () {
                onProductTap?.call(shoe);
              },
              onFavoriteTap: () {
                onFavoriteTap?.call(shoe);
              },
            );
          },
        ),
      ],
    );
  }
}