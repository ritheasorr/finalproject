import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/models/product.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for products...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (text) {
              setState(() {
                _searchTerm = text;
              });
            },
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: (_searchTerm.isEmpty)
                ? FirebaseFirestore.instance.collection('1').snapshots() // Fetch all if empty
                : FirebaseFirestore.instance
                .collection('1')
                .where('Name', isGreaterThanOrEqualTo: _searchTerm)
                .where('Name', isLessThan: _searchTerm + 'z')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Error fetching products');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final products = snapshot.data!.docs.map((doc) => Product.fromFirestore(doc)).toList();

              return GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context)=> FullScreenSearchPage(
                          products: products,
                        )
                    )
                  );
                },
                child: _searchTerm.isNotEmpty
                    ? ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                        title: Text(product.Name),
                    );
                  },
                )
                    : const SizedBox.shrink(),
              );

            },
          ),
        ),
      ],
    );
  }
}


class FullScreenSearchPage extends StatelessWidget {
  final List<Product> products;

  const FullScreenSearchPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          const Text('Search Results'),
    ),
    body: ListView.builder(
    itemCount:
    products.length,
    itemBuilder: (context, index) {
    final product = products[index];
    return ListTile(
    title: Text(product.Name),

    );
    },
    ),
    );
  }
}