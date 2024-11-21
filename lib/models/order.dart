import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';

class Orders {
  String id, address1, paidBy;
  int postalCode, totalItem;
  double amount;
  DateTime purchasedBy;
  DateTime deliveryDate;
  List<Product> products;

  Orders({
    required this.id,
    required this.postalCode,
    required this.totalItem,
    required this.address1,
    required this.products,
    required this.paidBy,
    required this.amount,
    required this.purchasedBy,
    required this.deliveryDate,

  });

  // Factory constructor for converting Firestore document to Orders object
  Orders.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        postalCode = snapshot['postalCode'] ?? 0,
        totalItem = snapshot['totalItem'] ?? 0,
        address1 = snapshot['address1'] ?? '',
        paidBy = snapshot['paidBy'] ?? '',
        amount = snapshot['amount']?.toDouble() ?? 0.0,
        products = (snapshot['products'] as List<dynamic>)
            .map((item) => Product(
            Name: item['Name'] ?? '',
            Price: (item['Price'] ?? 0).toDouble(),
            ImageUrl: item['ImageUrl'] ?? '',
        ))
            .toList(),
        purchasedBy = (snapshot['purchasedBy'] as Timestamp).toDate(),
        deliveryDate = (snapshot['deliveryDate'] as Timestamp).toDate();

  // Converts Orders object to Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'postalCode': postalCode,
      'totalItem': totalItem,
      'address1': address1,
      'products': products.map((product) => {
        'Name': product.Name,
        'Price': product.Price,
        'ImageUrl': product.ImageUrl,
      }).toList(),
      'paidBy': paidBy,
      'amount': amount,
      'purchasedBy': Timestamp.fromDate(purchasedBy),
      'deliveryDate': Timestamp.fromDate(deliveryDate),
    };
  }
}