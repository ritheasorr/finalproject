import 'package:flutter/material.dart';
import '../screens/cart_page.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Text('Fenz'),
      shadowColor: Colors.blueGrey,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
          Navigator.pushNamed(context, '/categories');},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
                  (route) => false,
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
