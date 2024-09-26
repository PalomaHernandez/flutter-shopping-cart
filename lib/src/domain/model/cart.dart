import 'package:flutter/material.dart';
import 'package:shopping_cart/src/domain/domain.dart';

class Cart with ChangeNotifier{
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addProduct(Product product){
    _cart.add(product);
    notifyListeners();
  }

  void deleteProduct(Product product){
    _cart.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cart.fold(0.0, (sum,product) => sum + product.price);
  }
}