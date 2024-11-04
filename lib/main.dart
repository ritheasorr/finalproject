import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/bottom_bar.dart';
import 'package:finalproject/pages/menu_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter Template',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BottomNavigationBarExample(),
    );
  }
}

