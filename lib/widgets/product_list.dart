// import 'package:flutter/material.dart';
// import 'package:finalproject/screens/product.dart';
//
// class ProductList extends StatelessWidget {
//   const ProductList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Product>>(
//       stream: getProducts(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           print('StreamBuilder Error: ${snapshot.error}');
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return
//             const Center(child: CircularProgressIndicator());
//         }
//
//         List<Product> products = snapshot.data ?? [];
//         print('Products in StreamBuilder: ${products.length}');
//
//         return SizedBox(
//           height: 280,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: products.length,
//             itemBuilder:
//                 (context, index) {
//               final product = products[index];
//
//               return ProductCard(product: product);
//             },
//           ),
//         );
//       },
//     );
//
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         width: 180,
//         child: Column(
//           children: [
//             Image.network(
//               product.ImageUrl,
//               errorBuilder: (context, error, stackTrace) {
//                 debugPrint('Image loading error: ${error.toString()}');
//
//                 return const Icon(Icons.error);
//               },
//               loadingBuilder: (BuildContext context, Widget child,
//                   ImageChunkEvent? loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return Center(
//                   child: CircularProgressIndicator(
//                     value: loadingProgress.expectedTotalBytes != null
//                         ? loadingProgress.cumulativeBytesLoaded /
//                         loadingProgress.expectedTotalBytes!
//                         : null,
//                   ),
//                 );
//               },
//             ),
//             Text(product.Name),
//             Text(product.Description),
//             Text('\$${product.Price.toStringAsFixed(2)}'),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_page.dart'; // Import the detail page


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          width: 180,
          child: Column(
            children: [
              Image.network(
                product.ImageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.Name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product.Price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          height: 280,
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
