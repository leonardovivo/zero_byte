import 'package:flutter/material.dart';
import 'package:zero_byte/modules/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  double get totalPrice => _products.fold(
      0, (total, product) => total + product.price * product.quantity);

  void addProduct(Product product) {
  var existingProduct = _products.firstWhere(
    (p) => p.name == product.name,
    orElse: () => Product(name: '', price: 0, quantity: 0), // Retorna um produto "vazio"
  );
  
  if (existingProduct.name.isNotEmpty) {
    // Verifica se o nome não está vazio, ou seja, o produto existe
    existingProduct.quantity++;
  } else {
    // Caso seja um produto "vazio", adicione o novo produto
    _products.add(product);
  }
  notifyListeners();
}


  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }

  bool get isCartEmpty => _products.isEmpty;
}
