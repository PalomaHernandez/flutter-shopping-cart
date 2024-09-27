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
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: SingleChildScrollView(
          child:
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
                CustomRichText(label: "Description: ", value: product.description),
                CustomRichText(label: "Category: ", value: product.category),
                Row(
                  children: [
                    CustomRichText(
                        label: "Rating: ", value: product.rating.toString()),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 231, 217, 92),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 10.0),
                  child: Center(
                    child: CustomButton(
                      label: "Add to cart",
                      onPressed: () {
                        context.read<Cart>().addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                          duration: Duration(seconds: 2),
                          content:
                              Text('${product.title} added to cart')));
                      }
                    )
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
