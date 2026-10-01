import 'package:flutter/material.dart';

import '../contollers/cart_controller.dart';
import '../widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController =
        CartController.instance;

    return AnimatedBuilder(
      animation: cartController,
      builder: (context, child) {
        final cartItems =
            cartController.cartItems;

        return Scaffold(
          backgroundColor: const Color(0xFFF8F8F7),

          // =========================
          // APP BAR
          // =========================

          appBar: AppBar(
            backgroundColor:
                const Color(0xFFF8F8F7),
            elevation: 0,
            centerTitle: false,
            title: Text(
              'My Cart (${cartController.totalItems})',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),

          // =========================
          // BODY
          // =========================

          body: cartItems.isEmpty
              ? _buildEmptyState()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding:
                            const EdgeInsets.fromLTRB(
                          16,
                          8,
                          16,
                          16,
                        ),
                        itemCount:
                            cartItems.length,
                        itemBuilder:
                            (context, index) {
                          final item =
                              cartItems[index];

                          return CartCard(
                            item: item,

                            onIncrement: () {
                              cartController
                                  .incrementQuantity(
                                index,
                              );
                            },

                            onDecrement: () {
                              cartController
                                  .decrementQuantity(
                                index,
                              );
                            },

                            onRemove: () {
                              cartController
                                  .removeItem(
                                index,
                              );
                            },
                          );
                        },
                      ),
                    ),

                    // =========================
                    // CHECKOUT SUMMARY
                    // =========================

                    _buildBottomSummary(
                      context,
                      cartController,
                    ),
                  ],
                ),
        );
      },
    );
  }

  // =========================
  // BOTTOM SUMMARY
  // =========================

  Widget _buildBottomSummary(
    BuildContext context,
    CartController controller,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),

              const Spacer(),

              Text(
                formatPrice(
                  controller.totalPrice,
                ),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'The item has been checked out.',
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
                      BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // EMPTY STATE
  // =========================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 42,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Add your favorite sneakers\n'
              'and they will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatPrice(double price) {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
        )}';
  }
}