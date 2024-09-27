import 'package:flutter/material.dart';
import 'package:shopping_cart/src/domain/domain.dart';

class Cart with ChangeNotifier {
  final List<Map<Product, int>> _items = [];

  List<Map<Product, int>> get items => _items;

  void addProduct(Product product) {
    final existingProduct = _items.firstWhere(
      (element) => element.containsKey(product),
      orElse: () => {},
    );

    if (existingProduct.isEmpty) {
      _items.add({product: 1});
    } else {
      var index = _items.indexOf(existingProduct);

      if (_items[index][product] != null) {
        _items[index][product] = _items[index][product]! + 1;
      }
    }
    notifyListeners();
  }

  void deleteProduct(Product product) {
    final existingProduct = _items.firstWhere(
      (element) => element.containsKey(product),
      orElse: () => {},
    );

    if (existingProduct.isNotEmpty) {
      if (existingProduct[product] == 1) {
        items.remove(existingProduct);
      } else {
        var index = _items.indexOf(existingProduct);

        if (_items[index][product] != null) {
          _items[index][product] = _items[index][product]! - 1;
        }
      }
      notifyListeners();
    }
  }

  double get totalPrice => items.fold(0.0, (total, element) {
        final product = element.keys.first;
        final quantity = element[product];
        return total + (product.price * quantity!);
      });
}
