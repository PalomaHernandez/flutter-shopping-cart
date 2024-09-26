import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/src/domain/domain.dart';

class HttpProductRespository implements ProductRepository{

  @override
  Future<List<Product>> getProducts() async{
    final uri = Uri.parse(ProductRepository.endpoint);

    final response = await http.get(uri);

    if(response.statusCode == HttpStatus.ok){
      final productList = Product.fromDynamicList(json.decode(response.body));
      return productList;
    } else {
      throw Exception('Failed to load product data');
    }
  }
}