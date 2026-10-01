import 'package:flutter/material.dart';
import 'package:hello_flutter/contollers/detail_controller.dart';
import 'package:hello_flutter/contollers/cart_controller.dart';

import '../models/shoe.dart';
import '../widgets/product_gallery.dart';
import '../widgets/size_selector.dart';
import '../widgets/quantity_stepper.dart';

class DetailScreen extends StatefulWidget {
  final Shoe shoe;
  final int initialImageIndex;

  const DetailScreen({
    super.key,
    required this.shoe,
    this.initialImageIndex = 0,
  });

  @override
  State<DetailScreen> createState() =>
      _DetailScreenState();
}

class _DetailScreenState
    extends State<DetailScreen> {
  late DetailController controller;

  @override
  void initState() {
    super.initState();

    controller = DetailController(
      widget.shoe,
    );
  }

  String formatPrice(double price) {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F8),

      body: SafeArea(
        child: Column(
          children: [
            // ==================================
            // TOP BAR
            // ==================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                8,
              ),
              child: Row(
                children: [
                  _CircleButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  const Spacer(),

                  _CircleButton(
                    icon: controller.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    backgroundColor:
                        controller.isFavorite
                            ? Colors.black
                            : Colors.white,
                    iconColor:
                        controller.isFavorite
                            ? Colors.white
                            : Colors.black,
                    onTap: () {
                      setState(() {
                        controller.toggleFavorite();
                      });
                    },
                  ),

                  const SizedBox(width: 8),

                  _CircleButton(
                    icon: Icons.share_outlined,
                    onTap: () {
                      debugPrint(
                        'Share ${widget.shoe.name}',
                      );
                    },
                  ),
                ],
              ),
            ),

            // ==================================
            // CONTENT
            // ==================================

            Expanded(
              child: SingleChildScrollView(
                physics:
                    const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  16,
                  5,
                  16,
                  125,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // GALLERY
                    ProductGallery(
                      shoe: widget.shoe,
                      initialIndex: widget.initialImageIndex,
                    ),

                    const SizedBox(height: 22),

                    // ==================================
                    // BRAND + CATEGORY
                    // ==================================

                    Text(
                      '${widget.shoe.brand.toUpperCase()} · ${widget.shoe.category.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade500,
                        letterSpacing: 0.6,
                      ),
                    ),

                    const SizedBox(height: 7),

                    // ==================================
                    // NAME + PRICE
                    // ==================================

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.shoe.name,
                            style: const TextStyle(
                              fontSize: 24,
                              height: 1.1,
                              fontWeight:
                                  FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.end,
                          children: [
                            Text(
                              formatPrice(
                                widget.shoe.price,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.w800,
                              ),
                            ),

                            if (widget.shoe.oldPrice !=
                                null)
                              Text(
                                formatPrice(
                                  widget.shoe.oldPrice!,
                                ),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors
                                      .grey.shade500,
                                  decoration:
                                      TextDecoration
                                          .lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ==================================
                    // RATING
                    // ==================================

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB000),
                          size: 19,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          widget.shoe.rating
                              .toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight:
                                FontWeight.w800,
                          ),
                        ),

                        const SizedBox(width: 5),

                        Text(
                          '(${widget.shoe.reviewCount} ulasan)',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ==================================
                    // DESCRIPTION
                    // ==================================

                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      widget.shoe.description,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.6,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      height: 1,
                      color: Colors.grey.shade200,
                    ),

                    const SizedBox(height: 22),

                    // ==================================
                    // SIZE
                    // ==================================

                    SizeSelector(
                      selectedSize:
                          controller.selectedSize,
                      onSizeSelected: (size) {
                        setState(() {
                          controller.selectSize(
                            size,
                          );
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // ==================================
                    // QUANTITY
                    // ==================================

                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Jumlah',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                        ),

                        QuantityStepper(
                          quantity:
                              controller.quantity,
                          onIncrement: () {
                            setState(() {
                              controller
                                  .incrementQuantity();
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              controller
                                  .decrementQuantity();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ==================================
      // BOTTOM ADD TO CART
      // ==================================

      bottomNavigationBar:
          _buildBottomAction(),
    );
  }

  Widget _buildBottomAction() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          16,
          12,
          16,
          12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          children: [
            // TOTAL
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  formatPrice(
                    controller.totalPrice,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 20),

            // ADD TO CART
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                onPressed: () {
                  if (controller.selectedSize == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Pilih ukuran terlebih dahulu.',
                        ),
                      ),
                    );

                    return;
                  }

                  CartController.instance.addToCart(
                    shoe: widget.shoe,
                    size: controller.selectedSize!,
                    quantity: controller.quantity,
                  );

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.shoe.name} ditambahkan ke keranjang.',
                      ),
                    ),
                  );
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(28),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons
                            .shopping_bag_outlined,
                        size: 19,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// CIRCLE BUTTON
// ==========================================

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;

  const _CircleButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: iconColor,
        ),
      ),
    );
  }
}