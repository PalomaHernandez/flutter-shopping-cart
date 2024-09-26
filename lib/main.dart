import 'package:flutter/material.dart';
import 'package:shopping_cart/src/presentation/presentation.dart';
import 'package:shopping_cart/src/data/data.dart';
import 'package:shopping_cart/src/domain/domain.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<Products>.value(
          value: Products(productRepository: HttpProductRespository()),
        ),
        ChangeNotifierProvider<Cart>.value(
          value: Cart()
        )
      ],
      child: const ShoppingCartApp(),
    ),
  );
}

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 219, 219, 219)),
        useMaterial3: true,
      ),
      home: const CatalogScreen(),
    );
  }
}