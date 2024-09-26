import 'dart:async';
import 'package:shopping_cart/src/domain/domain.dart';

abstract class Disposable{
  void dispose();
}

class Products implements Disposable{
  Products({
    required ProductRepository productRepository,
  }): _productRepository = productRepository;

  final ProductRepository _productRepository;

  final _productStreamController = StreamController<List<Product>>.broadcast();

  Stream<List<Product>> get productStream => _productStreamController.stream;

  void getProducts() async {
    try {
      final products = await _productRepository.getProducts();
      _productStreamController.add(products);
    } catch (e) {
      _productStreamController.addError(e);
    }
  }
  
  @override
  void dispose() {
    _productStreamController.close();
  }
}