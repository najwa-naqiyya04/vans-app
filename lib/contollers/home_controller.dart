import '../data/dummy_data.dart';
import '../models/shoe.dart';
import 'favorite_controller.dart';

class HomeController {
  final List<Shoe> allShoes = dummyShoes;

  String searchText = '';
  String selectedCategory = 'All';

  List<Shoe> get filteredShoes {
    List<Shoe> result = List.from(allShoes);

    if (selectedCategory != 'All') {
      result = result
          .where(
            (shoe) => shoe.category == selectedCategory,
          )
          .toList();
    }

    if (searchText.isNotEmpty) {
      result = result
          .where(
            (shoe) =>
                shoe.name
                    .toLowerCase()
                    .contains(
                      searchText.toLowerCase(),
                    ) ||
                shoe.category
                    .toLowerCase()
                    .contains(
                      searchText.toLowerCase(),
                    ),
          )
          .toList();
    }

    return result;
  }

  void updateSearch(String value) {
    searchText = value;
  }

  void selectCategory(String category) {
    selectedCategory = category;
  }

  bool isFavorite(String shoeId) {
    return FavoriteController.instance.favoriteShoes.any(
      (shoe) => shoe.id == shoeId,
    );
  }

  void toggleFavorite(String shoeId) {
    final shoe = allShoes.firstWhere(
      (shoe) => shoe.id == shoeId,
    );

    FavoriteController.instance.toggleFavorite(shoe);
  }

  List<Shoe> get popularShoes {
    return allShoes
        .where((shoe) => shoe.isPopular)
        .toList();
  }

  List<Shoe> get newShoes {
    return allShoes
        .where((shoe) => shoe.isNew)
        .toList();
  }
}