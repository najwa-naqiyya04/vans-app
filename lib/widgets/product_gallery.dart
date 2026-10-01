import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ProductGallery extends StatefulWidget {
  final Shoe shoe;
  final int initialIndex;

  const ProductGallery({
    super.key,
    required this.shoe,
    this.initialIndex = 0,
  });

  @override
  State<ProductGallery> createState() =>
      _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  late PageController _pageController;

  late int currentIndex;

  @override
  void initState() {
    super.initState();

    final images = widget.shoe.detailImages.isNotEmpty
        ? widget.shoe.detailImages
        : [widget.shoe.image];

    currentIndex = widget.initialIndex.clamp(
      0,
      images.length - 1,
    );

    _pageController = PageController(
      initialPage: currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.shoe.detailImages.isNotEmpty
        ? widget.shoe.detailImages
        : [widget.shoe.image];

    return Column(
      children: [
        // ==================================
        // SATU GAMBAR UTAMA
        // ==================================

        Container(
          height: 330,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F3),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                      images[index],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              // ==================================
              // COUNTER 1/3
              // ==================================

              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                      alpha: 0.9,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${currentIndex + 1}/${images.length}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // ==================================
        // THUMBNAIL
        // ==================================

        SizedBox(
          height: 66,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              final bool isSelected =
                  currentIndex == index;

              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  width: 66,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? Colors.black
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return const Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}