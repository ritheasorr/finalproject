import 'package:finalproject/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/widgets/carousel_content.dart';
import 'package:finalproject/widgets/menu_button.dart';
import 'package:finalproject/widgets/cate_button.dart';
import 'package:finalproject/widgets/product_list.dart';

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
          SizedBox(height:20),
          CategoryButtons(),
          SizedBox(height: 20),
          ProductList(),
        ],
      ),
    );
  }
}


