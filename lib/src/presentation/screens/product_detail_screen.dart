import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/src/domain/domain.dart';
import 'package:shopping_cart/src/presentation/presentation.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductImage(
                  height: 220.0,
                  width: 200.0,
                  tag: product.id,
                  url: product.image,
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: product.title,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ ${product.price.toStringAsFixed(2)}',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: 'Description: ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: product.description,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Category: ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: product.category,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Rating: ',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: product.rating.toString(),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 231, 217, 92),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        context.read<Cart>().addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.title} added to cart'),
                        )
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color.fromARGB(255, 61, 61, 61),
                        ),
                        child: const Center(
                          child: Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
