import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget{
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() =>
    _MenuButton();
}

class _MenuButton extends State<MenuButton>{
  Widget build(BuildContext context){
    return Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Testing'),
              accountEmail: Text('testing1@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blueAccent
              ),
            ),

            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),

            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),

            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),
            Divider(),
            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                  title: Text('Home page'),
                  leading: Icon(Icons.home)
              ),
            ),
          ],
        ),
      );
  }
}