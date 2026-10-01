import 'package:flutter/material.dart';

import 'package:hello_flutter/contollers/home_controller.dart';
import 'package:hello_flutter/contollers/favorite_controller.dart';
import 'package:hello_flutter/screen/detail_screen.dart';

import '../data/dummy_data.dart';
import '../widgets/home_header.dart';
import '../widgets/search_field.dart';
import '../widgets/category_list.dart';
import '../widgets/promo_banner.dart';
import '../widgets/product_section.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onProfileTap;

  const HomeScreen({
    super.key,
    this.onProfileTap,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();

  final TextEditingController searchController =
      TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFiltering =
        controller.searchText.isNotEmpty ||
        controller.selectedCategory != 'All';

    final Set<String> favoriteIds =
        FavoriteController.instance.favoriteShoes
            .map((shoe) => shoe.id)
            .toSet();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F7),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            16,
            15,
            16,
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                onNotificationTap: () {
                  debugPrint('Notification clicked');
                },

                // Klik foto profile
                // langsung pindah ke tab Profile
                onProfileTap: () {
                  widget.onProfileTap?.call();
                },
              ),

              const SizedBox(height: 20),

              SearchField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    controller.updateSearch(value);
                  });
                },
                onFilterTap: () {
                  debugPrint('Filter clicked');
                },
              ),

              const SizedBox(height: 18),

              PromoBanner(
                banners: dummyBanners,
              ),

              const SizedBox(height: 20),

              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              CategoryList(
                selectedCategory:
                    controller.selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    controller.selectCategory(category);
                  });
                },
              ),

              const SizedBox(height: 24),

              if (isFiltering)
                _buildSearchResults(favoriteIds)
              else
                _buildHomeProducts(favoriteIds),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeProducts(Set<String> favoriteIds) {
    return Column(
      children: [
        ProductSection(
          title: 'Trending Now',
          shoes: controller.popularShoes,
          favoriteIds: favoriteIds,

          onProductTap: (shoe) {
            final int imageIndex =
                shoe.detailImages.indexOf(shoe.image);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  shoe: shoe,
                  initialImageIndex:
                      imageIndex >= 0 ? imageIndex : 0,
                ),
              ),
            );
          },

          onFavoriteTap: (shoe) {
            setState(() {
              controller.toggleFavorite(shoe.id);
            });
          },

          onSeeAll: () {
            debugPrint('See all trending');
          },
        ),

        const SizedBox(height: 28),

        ProductSection(
          title: 'New Arrivals',
          shoes: controller.newShoes,
          favoriteIds: favoriteIds,

          onProductTap: (shoe) {
            final int imageIndex =
                shoe.detailImages.indexOf(shoe.image);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  shoe: shoe,
                  initialImageIndex:
                      imageIndex >= 0 ? imageIndex : 0,
                ),
              ),
            );
          },

          onFavoriteTap: (shoe) {
            setState(() {
              controller.toggleFavorite(shoe.id);
            });
          },

          onSeeAll: () {
            debugPrint('See all new arrivals');
          },
        ),
      ],
    );
  }

  Widget _buildSearchResults(Set<String> favoriteIds) {
    final shoes = controller.filteredShoes;

    if (shoes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 42,
                color: Colors.grey,
              ),

              SizedBox(height: 12),

              Text(
                'No sneakers found',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 5),

              Text(
                'Try another keyword or category.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ProductSection(
      title: 'Search Results',
      shoes: shoes,
      favoriteIds: favoriteIds,

      onProductTap: (shoe) {
        final int imageIndex =
            shoe.detailImages.indexOf(shoe.image);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              shoe: shoe,
              initialImageIndex:
                  imageIndex >= 0 ? imageIndex : 0,
            ),
          ),
        );
      },

      onFavoriteTap: (shoe) {
        setState(() {
          controller.toggleFavorite(shoe.id);
        });
      },
    );
  }
}