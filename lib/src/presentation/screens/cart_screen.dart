import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/src/presentation/presentation.dart';
import 'package:shopping_cart/src/domain/domain.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.cart.length,
        itemBuilder: (context, index) {
          final product = cart.cart[index];
          return ListTile(
            leading: ProductImage(
                height: 20.0, width: 50.0, tag: product.id, url: product.image),
            title: Text(product.title),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                context.read<Cart>().deleteProduct(product);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Mostrar el total de la compra
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              // Botón para pagar
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  height: 50.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color.fromARGB(255, 61, 61, 61), 
                  ),
                  child: const Center(
                    child: Text(
                      'Check out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        
      ),
    );
  }
}
