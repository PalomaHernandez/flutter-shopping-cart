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
        title: const Text('Your Cart')
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final items = cart.items[index];
              final product = items.keys.first;
              return ListTile(
                leading: ProductImage(
                    height: 50.0,
                    width: 50.0,
                    tag: product.id,
                    url: product.image),
                title: Text(product.title),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 230, 229, 229),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          context.read<Cart>().deleteProduct(product);
                        },
                      ),
                      Text(
                        '${items[product]}', 
                        style: TextStyle(fontSize: 20.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          context.read<Cart>().addProduct(product);
                        },
                      ),
                    ],
                  )
                )
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  '\$${cart.totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            CustomButton(label: "Check Out", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
