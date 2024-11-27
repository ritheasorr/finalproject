import 'package:flutter/material.dart';
import 'men_tab.dart';
import 'women_tab.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/categories');
            },
          ),
          title: const Text(
            'Categories',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Looking for something ?',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () {
                      // Add filter functionality here
                    },
                    icon: const Icon(Icons.tune_outlined, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Tab bar for switching categories
            const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "WOMEN"), // Tab for Women
                Tab(text: "MEN"),   // Tab for Men
              ],
            ),
            //sss
            // TabBarView to display content of selected tab
            Expanded(
              child: const TabBarView(
                children: [
                  WomenTab(),
                  MenTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
