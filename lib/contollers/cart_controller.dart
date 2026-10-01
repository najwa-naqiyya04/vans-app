import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/shoe.dart';

class CartController extends ChangeNotifier {
  CartController._();

  static final CartController instance =
      CartController._();

  final List<CartItem> cartItems = [];

  // =========================
  // ADD TO CART
  // =========================

  void addToCart({
    required Shoe shoe,
    required String size,
    required int quantity,
  }) {
    final existingIndex = cartItems.indexWhere(
      (item) =>
          item.shoe.id == shoe.id &&
          item.size == size,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += quantity;
    } else {
      cartItems.add(
        CartItem(
          shoe: shoe,
          size: size,
          quantity: quantity,
        ),
      );
    }

    notifyListeners();
  }

  // =========================
  // INCREMENT
  // =========================

  void incrementQuantity(int index) {
    cartItems[index].quantity++;

    notifyListeners();
  }

  // =========================
  // DECREMENT
  // =========================

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;

      notifyListeners();
    }
  }

  // =========================
  // REMOVE
  // =========================

  void removeItem(int index) {
    cartItems.removeAt(index);

    notifyListeners();
  }

  // =========================
  // TOTAL ITEM
  // =========================

  int get totalItems {
    int total = 0;

    for (final item in cartItems) {
      total += item.quantity;
    }

    return total;
  }

  // =========================
  // TOTAL PRICE
  // =========================

  double get totalPrice {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice;
    }

    return total;
  }

  // =========================
  // CLEAR CART
  // =========================

  void clearCart() {
    cartItems.clear();

    notifyListeners();
  }
}