import 'package:flutter/material.dart';
import 'package:finalproject/widgets/product_list.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Icon(Icons.percent),
            title: Text('On sale'),
            children: <Widget>[
              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, '/home');
                },
                child: ListTile(
                    title: Text('Wreck Cap'),
                ),
              )
              ,
            ],
          ),

        ),

        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Icon(Icons.people),
            title: Text('Men and Women'),
            children: <Widget>[
              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, '/home');
                },
                child: ListTile(
                    title: Text('Men')),
              ),
              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, '/home');
                },
                child: ListTile(
                    title: Text('Women')),
              ),
            ],
          ),

        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Icon(Icons.boy),
            title: Text('Kids'),
            children: <Widget>[
              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, '/home');
                },
                child: ListTile(
                    title: Text('Suits')),
              ),
              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, '/home');
                },
                child: ListTile(
                    title: Text('Sneakers')),
              ),
            ],
          ),

        ),

      ],
    );
  }
}