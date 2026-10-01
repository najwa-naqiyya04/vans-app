import '../models/shoe.dart';

class DetailController {
  final Shoe shoe;

  DetailController(this.shoe);

  String? selectedSize;

  int quantity = 1;

  bool isFavorite = false;

  void selectSize(String size) {
    selectedSize = size;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  double get totalPrice {
    return shoe.price * quantity;
  }
}