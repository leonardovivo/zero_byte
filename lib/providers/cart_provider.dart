import 'package:flutter/material.dart';
import 'package:zero_byte/modules/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  double get totalPrice => _products.fold(
      0, (total, product) => total + product.price * product.quantity);

  void addProduct(Product product) {
    var existingProduct = _products.firstWhere(
      (p) => p.name == product.name,
      orElse: () => Product(name: '', price: 0, quantity: 0),
    );

    if (existingProduct.name.isNotEmpty) {
      existingProduct.quantity++;
    } else {
      _products.add(Product(
        name: product.name,
        price: product.price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    var existingProduct = _products.firstWhere(
      (p) => p.name == product.name,
      orElse: () => Product(name: '', price: 0, quantity: 0),
    );

    if (existingProduct.name.isNotEmpty) {
      if (existingProduct.quantity > 1) {
        existingProduct.quantity--;
      } else {
        _products.remove(existingProduct);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }

  bool get isCartEmpty => _products.isEmpty;
}
