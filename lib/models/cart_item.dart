import 'shoe.dart';

class CartItem {
  final Shoe shoe;
  final String size;
  int quantity;

  CartItem({
    required this.shoe,
    required this.size,
    required this.quantity,
  });

  double get totalPrice {
    return shoe.price * quantity;
  }
}