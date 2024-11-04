import 'package:finalproject/pages/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/pages/carousel_content.dart';
import 'package:finalproject/pages/menu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  Color x = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(),
      drawer: MenuButton(),
      body: ListView(
        children: <Widget>[
          CarouselContent(),
        ],
      ),
    );
  }
}


