import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> items = [];

  void add(Product product) {
    final index =
        items.indexWhere((item) => item.product == product);
    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(CartItem(product, 1));
    }
    notifyListeners();
  }

  void increase(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrease(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
    notifyListeners();
  }

  void remove(CartItem item) {
    items.remove(item);
    notifyListeners();
  }

  int get count =>
      items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => items.fold(
        0,
        (sum, item) => sum + item.product.price * item.quantity,
      );
}
