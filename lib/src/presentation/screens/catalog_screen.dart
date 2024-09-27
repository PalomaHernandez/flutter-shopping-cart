import 'package:flutter/material.dart';
import 'package:shopping_cart/src/domain/domain.dart';
import 'package:shopping_cart/src/presentation/presentation.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late final Products _catalogState;

  @override
  void initState() {
    super.initState();
    _catalogState = context.read<Products>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _catalogState.getProducts();
    });
  }

  @override
  void dispose() {
    _catalogState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ), 
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon:const Icon(Icons.shopping_cart_checkout, size: 30.0),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _catalogState.getProducts(),
        child: StreamBuilder(
            stream: _catalogState.productStream,
            builder: (context, snapshot) {
              late Widget result;

              if (snapshot.hasError) {
                result = Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (!snapshot.hasData) {
                result = const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var catalog = snapshot.data!;
                result = _CatalogBody(catalog: catalog);
              }
              return result;
            }),
      ),
    );
  }
}

class _CatalogBody extends StatelessWidget {
  const _CatalogBody({required this.catalog});

  final List<Product> catalog;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: catalog.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        final product = catalog[index];
        return ProductItem(product: product);
      },
    );
  }
}
