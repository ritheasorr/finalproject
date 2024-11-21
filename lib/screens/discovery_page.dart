import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/models/product.dart';
import 'package:finalproject/widgets/app_bar.dart';
import 'package:finalproject/widgets/dropdown_button.dart';
import 'package:finalproject/widgets/menu_button.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(),
      drawer: MenuButton(),
      body: Column(
        children: <Widget>[
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
            child: SizedBox(
              height: 200,
              child: StreamBuilder<QuerySnapshot>(
                stream: (_searchTerm.isEmpty)
                    ? FirebaseFirestore.instance.collection('1').snapshots()
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

                  if (_searchTerm.isNotEmpty) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenSearchPage(
                              products: products,
                            ),
                          ),
                        );
                      },
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ListTile(
                            title: Text(product.Name),
                          );
                        },
                      ),
                    );
                  } else {
                    return CategoryList();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenSearchPage extends StatelessWidget {
  final List<Product> products;

  const FullScreenSearchPage({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: products.length,
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