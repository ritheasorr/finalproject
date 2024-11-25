import 'package:flutter/material.dart';
import '../widgets/CartItem.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];
  double _voucherDiscount = 0.0; // Tracks applied voucher discount
  String? _appliedVoucher; // Tracks the applied voucher code
  final double _deliveryFee = 2.0;

  List<CartItem> get cartItems => _cartItems;
  double get voucherDiscount => _voucherDiscount;
  String? get appliedVoucher => _appliedVoucher;

  // Add item to the cart
  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  // Increase item quantity
  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  // Decrease item quantity
  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartItems.remove(item);
    }
    notifyListeners();
  }

  // Subtotal price
  double get subtotalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.Price * item.quantity));
  }

  // Total price after voucher and delivery fee
  double get totalPrice {
    return subtotalPrice - _voucherDiscount + _deliveryFee;
  }

  // Apply a voucher code
  String applyVoucher(String code) {
    const voucherCodes = {
      "abc": 5.0,
      "DISCOUNT10": 10.0,
    };

    if (voucherCodes.containsKey(code)) {
      _voucherDiscount = voucherCodes[code]!;
      _appliedVoucher = code;
      notifyListeners();
      return "Voucher applied successfully!";
    } else {
      _voucherDiscount = 0.0; // Reset discount if the code is invalid
      _appliedVoucher = null;
      notifyListeners();
      return "Invalid voucher code.";
    }
  }

  // Clear the cart
  void clearCart() {
    _cartItems.clear();
    _voucherDiscount = 0.0;
    _appliedVoucher = null;
    notifyListeners();
  }
}


