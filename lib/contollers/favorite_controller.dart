import 'package:flutter/foundation.dart';

import '../models/shoe.dart';

class FavoriteController extends ChangeNotifier {
  FavoriteController._();

  static final FavoriteController instance =
      FavoriteController._();

  final List<Shoe> favoriteShoes = [];

  bool isFavorite(Shoe shoe) {
    return favoriteShoes.any(
      (item) => item.id == shoe.id,
    );
  }

  void toggleFavorite(Shoe shoe) {
    if (isFavorite(shoe)) {
      favoriteShoes.removeWhere(
        (item) => item.id == shoe.id,
      );
    } else {
      favoriteShoes.add(shoe);
    }

    notifyListeners();
  }

  void removeFavorite(Shoe shoe) {
    favoriteShoes.removeWhere(
      (item) => item.id == shoe.id,
    );

    notifyListeners();
  }
}