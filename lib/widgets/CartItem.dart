class CartItem {
  final String Name;
  final double Price;
  final String ImageUrl;
  final String Size;
  int productCount;
  int quantity;

  CartItem({
    required this.Name,
    required this.ImageUrl,
    required this.Price,
    required this.Size,
    required this.productCount,
    this.quantity = 1,
  });
}
