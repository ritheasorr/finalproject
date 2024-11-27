
import 'package:flutter/material.dart';


class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: const Icon(Icons.view_module_outlined),
              title: const Text('All Categories'),
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories_page');
                  },
                  child: const ListTile(
                    title: Text('Category Page'),
                  ),
                ),
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: const Icon(Icons.percent),
              title: const Text('On Sale'),
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories_page');
                  },
                  child: const ListTile(
                    title: Text('Wreck Cap'),
                  ),
                ),
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: const Icon(Icons.people),
              title: const Text('Men and Women'),
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories_page');
                  },
                  child: const ListTile(
                    title: Text('Men'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories_page');
                  },
                  child: const ListTile(
                    title: Text('women'),
                  ),
                ),
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: const Icon(Icons.boy),
              title: const Text('Kids'),
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories_page');
                  },
                  child: const ListTile(
                    title: Text('Suits'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories_page');
                  },
                  child: const ListTile(
                    title: Text('Sneakers'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
