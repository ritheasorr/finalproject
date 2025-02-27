import 'package:flutter/material.dart';
import 'package:finalproject/screens/home_page.dart';

import '../screens/cart_page.dart';

import 'package:finalproject/screens/discovery_page.dart';
import 'package:finalproject/screens/upload_screen.dart';
import 'package:finalproject/screens/setting_page.dart';



class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key, required int selectedIndex, required void Function(int index) onItemTapped});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),// Index 0
    DiscoveryPage(),
    UploadPage(),
    CartPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16.0),  // Adjusts vertical alignment
              child: Icon(Icons.storefront),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(Icons.search),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(Icons.file_upload_outlined),
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}



