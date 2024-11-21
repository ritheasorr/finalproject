import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String Name;
  final double Price;

  //final String Description;
  final String ImageUrl;

  Product({
    required this.Name,
    required this.Price,
    // required this.Description,
    required this.ImageUrl});


  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      Name: data['Name']??'',
      Price: data['Price']??'' as double, // Type conversion

      // Description: data['Description']??'',
      ImageUrl: data['ImageUrl']??'',
    );

  }
}

Stream<List<Product>> getProducts() {
  return FirebaseFirestore.instance
      .collection('1') // Use the new collection name
      .snapshots()
      .map((snapshot) {
    var products = snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    return products;
  });
}


