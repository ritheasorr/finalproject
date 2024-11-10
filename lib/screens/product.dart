import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String Name;
  final double Price;
  final String Description;
  final String Image;

  Product({required this.Name, required this.Price, required this.Description, required this.Image});

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    print('ProductName: ${data['Name']}');
    print('ProductPrice: ${data['Price']}');
    print('ProductDescription: ${data['Description']}');
    print('ProductImage: ${data['ImageUrl']}');
    return Product(
      Name: data['Name']??'',
      Price: data['Price']??'' as double, // Type conversion
      Description: '',
      Image: '',
    );

  }
}

Stream<List<Product>> getProducts() {
  return FirebaseFirestore.instance
      .collection('1') // Use the new collection name
      .snapshots()
      .map((snapshot) {
    print('Fetched documents: ${snapshot.docs}'); // Print fetched documents
    var products = snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    print('Products list: $products'); // Print the list of products
    return products;
  });
}

