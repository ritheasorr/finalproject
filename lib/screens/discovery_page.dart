import 'package:flutter/material.dart';
import 'package:finalproject/widgets/app_bar.dart';
import 'package:finalproject/widgets/dropdown_button.dart';
import 'package:finalproject/widgets/menu_button.dart';
import 'package:finalproject/widgets/search_bar.dart';
import 'package:finalproject/widgets/product_list.dart';
import 'package:finalproject/models/product.dart';


class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(),
      drawer: MenuButton(),
      body: ListView(
        children: <Widget>[
          SearchBarWidget(),
          CategoryList(),
          // SearchBarWidget(),
        ],
      ),
    );
  }
}
