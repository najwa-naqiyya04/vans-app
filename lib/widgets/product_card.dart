import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ProductCard extends StatelessWidget {
  final Shoe shoe;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.shoe,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteTap,
  });

  String formatPrice(double price) {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            10,
            10,
            10,
            13,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================================
              // PRODUCT IMAGE
              // ==================================

              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(14),
                        child: Container(
                          color: const Color(0xFFF5F5F3),
                          child: Image.network(
                            shoe.image,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return const Center(
                                child: Icon(
                                  Icons
                                      .image_not_supported_outlined,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // ==================================
                    // FAVORITE BUTTON
                    // ==================================

                    Positioned(
                      top: 7,
                      right: 7,
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          width: 34,
                          height: 34,
                          decoration:
                              BoxDecoration(
                            color: isFavorite
                                ? Colors.black
                                : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withValues(
                                  alpha: 0.08,
                                ),
                                blurRadius: 5,
                                offset:
                                    const Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons
                                    .favorite_border,
                            size: 18,
                            color: isFavorite
                                ? Colors.white
                                : Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ==================================
              // BRAND + RATING
              // ==================================

              Row(
                children: [
                  Expanded(
                    child: Text(
                      shoe.brand,
                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color:
                            Colors.grey.shade500,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 5),

                  const Icon(
                    Icons.star_rounded,
                    size: 14,
                    color: Color(0xFFFFB800),
                  ),

                  const SizedBox(width: 2),

                  Text(
                    shoe.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // ==================================
              // PRODUCT NAME
              // ==================================

              Text(
                shoe.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                ),
              ),

              const SizedBox(height: 7),

              // ==================================
              // PRICE
              // ==================================

              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Text(
                    formatPrice(shoe.price),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  if (shoe.oldPrice != null) ...[
                    const SizedBox(width: 6),

                    Flexible(
                      child: Text(
                        formatPrice(
                          shoe.oldPrice!,
                        ),
                        maxLines: 1,
                        overflow:
                            TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9,
                          color:
                              Colors.grey.shade500,
                          decoration:
                              TextDecoration
                                  .lineThrough,
                          decorationColor:
                              Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}