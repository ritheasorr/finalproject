import 'package:flutter/material.dart';
import 'package:finalproject/screens/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('StreamBuilder Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return
          const Center(child: CircularProgressIndicator());
        }

        List<Product> products = snapshot.data ?? [];
        print('Products in StreamBuilder: ${products.length}');

        return SizedBox(
        height: 200,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder:
        (context, index) {
        final product = products[index];

        return ProductCard(product: product);
        },
        ),
        );
      },
    );

  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Image.network(
              product.Image,
              errorBuilder: (context, error, stackTrace) {
                print('Image loading error: $error');
                return const Icon(Icons.error);
              },
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            Text(product.Name),
            Text('\$${product.Price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
