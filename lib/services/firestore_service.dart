
import 'package:finalproject/models/product.dart';
import 'package:finalproject/models/users.dart';
import 'package:finalproject/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  AuthService authService = AuthService();
  //Create
  addProduct() {
    return FirebaseFirestore.instance
        .collection('1')
        .add({});
  }

  addProductUniqueID(id, productName, productImg, productDetails, productCategory,productColors, productPrice, productSizes, productRating,productCount){
    return FirebaseFirestore.instance
        .collection('1')
        .doc(id)
        .set({'id': id, 'ownerEmail': authService.getCurrentUser()!.email, 'Name': productName, 'ImageUrl': productImg, 'Description': productDetails, 'productCategory': productCategory,'Price': productPrice, 'productSizes': productSizes, 'productCount': productCount});

  }

  Future<void> addUser(email, userName, phoneNo){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(email.toString().toLowerCase())
        .set({'userName': userName});
  }

  addToCart(id,ownerEmail, productName, productImg, productDetails, productCategory,productColors, productPrice, productSizes, productRating,productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-cart-items')
        .doc(id)
        .set({'id': id, 'ownerEmail': ownerEmail, 'productName': productName, 'productImg': productImg, 'productDetails': productDetails, 'productCategory': productCategory,'productColors': productColors, 'productPrice': productPrice, 'productSizes': productSizes, 'productRating': productRating, 'productCount': productCount});

  }

  addToLiked(id,ownerEmail, productName, productImg, productDetails, productCategory,productColors, productPrice, productSizes, productRating,productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-liked-items')
        .doc(id)
        .set({'id': id, 'ownerEmail': ownerEmail, 'productName': productName, 'productImg': productImg, 'productDetails': productDetails, 'productCategory': productCategory,'productColors': productColors, 'productPrice': productPrice, 'productSizes': productSizes, 'productRating': productRating, 'productCount': productCount});
  }

  Future<DocumentReference<Map<String,dynamic>>> addToOrder(postalCode, address1, paidBy, amount, totalItem, purchasedBy, deliveryDate){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-orders-history')
        .add({'postalCode': postalCode, 'address1': address1, 'paidBy': paidBy, 'amount':amount, 'totalItem': totalItem, 'purchasedBy':purchasedBy, 'deliveryDate': deliveryDate});
  }

  addProductItems(id,ownerEmail,productName, productImg, productColors,productPrice,productSizes,productRating,productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-orders-history')
        .doc(id)
        .collection('purchased-items')
        .add({'ownerEmail': ownerEmail, 'productName':productName, 'productImg':productImg, 'productColors':productColors, 'productPrice':productPrice,'productSizes':productSizes,'productRating':productRating,'productCount':productCount});

  }

  //Delete
  removeProduct(id) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .delete();
  }

  removeFromCart(id){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-cart-items')
        .doc(id)
        .delete();
  }

  removeFromLiked(id){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-liked-items')
        .doc(id)
        .delete();
  }



Stream<FirestoreUser> getAuthUserFromFirestore(){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .snapshots()
        .map<FirestoreUser>((doc) => FirestoreUser.fromMap(doc.data()));
  }



  //Update
  editProduct(id, productName, productImg, productDetails, productCategory,productColors, productPrice, productSizes, productRating,productCount) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .update({'id':id,'ownerEmail': authService.getCurrentUser()!.email,'productName': productName, 'productImg': productImg, 'productDetails': productDetails, 'productCategory': productCategory,'productColors': productColors, 'productPrice': productPrice, 'productSizes': productSizes, 'productRating': productRating, 'productCount': productCount});
  }

  updateCartProduct(id, productName, productImg, productDetails, productCategory,productColors, productPrice, productSizes, productRating,productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-cart-items')
        .doc(id)
        .update({'id': id, 'ownerEmail': authService.getCurrentUser()!.email, 'productName': productName, 'productImg': productImg, 'productDetails': productDetails, 'productCategory': productCategory,'productColors': productColors, 'productPrice': productPrice, 'productSizes': productSizes, 'productRating': productRating, 'productCount': productCount});
  }

  updateLikedProduct(id, productName, productImg, productDetails, productCategory,productColors, productPrice, productSizes, productRating,productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-liked-items')
        .doc(id)
        .update({'id': id, 'ownerEmail': authService.getCurrentUser()!.email, 'productName': productName, 'productImg': productImg, 'productDetails': productDetails, 'productCategory': productCategory,'productColors': productColors, 'productPrice': productPrice, 'productSizes': productSizes, 'productRating': productRating, 'productCount': productCount});

  }

  increaseCartProductCount(id, productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-cart-items')
        .doc(id)
        .update({'productCount': productCount + 1});
  }

  decreaseCartProductCount(id, productCount){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(authService.getCurrentUser()!.email)
        .collection('users-cart-items')
        .doc(id)
        .update({'productCount': productCount - 1});
  }


}