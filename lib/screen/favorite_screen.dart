import 'package:flutter/material.dart';

import '../contollers/favorite_controller.dart';
import '../widgets/favorite_card.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController =
        FavoriteController.instance;

    return AnimatedBuilder(
      animation: favoriteController,
      builder: (context, child) {
        final favorites =
            favoriteController.favoriteShoes;

        return Scaffold(
          backgroundColor: const Color(0xFFF8F8F7),

          // =========================
          // APP BAR
          // =========================
          appBar: AppBar(
            backgroundColor: const Color(0xFFF8F8F7),
            elevation: 0,
            centerTitle: false,
            title: Text(
              'Favorites (${favorites.length})',
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
          body: favorites.isEmpty
              ? _buildEmptyState()
              : GridView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    12,
                    4,
                    12,
                    20,
                  ),
                  itemCount: favorites.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final shoe = favorites[index];

                    return FavoriteCard(
                      shoe: shoe,

                      // Klik card → Detail
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(
                              shoe: shoe,
                            ),
                          ),
                        );
                      },

                      // Klik ❤️ → hapus dari favorite
                      onRemove: () {
                        favoriteController
                            .removeFavorite(shoe);
                      },
                    );
                  },
                ),
        );
      },
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
                Icons.favorite_border_rounded,
                size: 42,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Your Favorite is Empty',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Save your favorite sneakers here\n'
              'so you can find them easily later.',
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
}