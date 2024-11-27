import 'package:flutter/material.dart';
import 'package:finalproject/widgets/user_account.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MenuButton extends StatefulWidget{
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() =>
    _MenuButton();
}

class _MenuButton extends State<MenuButton>{
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Colors.white,
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeaderWidget(),
            InkWell(
              onTap: () {
                // Handle navigation to Home page
                Navigator.pushNamed(context, '/home');
              },
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {
                // Handle navigation to My Account page
                Navigator.pushNamed(context, '/setting_page');
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                // Handle navigation to My Orders page
                Navigator.pushNamed(context, '/orders');
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_bag),
              ),
            ),
            InkWell(
              onTap: () {
                // Handle navigation to Categories page
                Navigator.pushNamed(context, '/categories_page');
              },
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.category),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                // Handle navigation to About Us page
                Navigator.pushNamed(context, '/about');
              },
              child: ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.info),
              ),
            ),
            InkWell(
              onTap: () {
                // Handle navigation to Contact Us page
                Navigator.pushNamed(context, '/contact');
              },
              child: ListTile(
                title: Text('Contact Us'),
                leading: Icon(Icons.phone),
              ),
            ),
            InkWell(
              onTap: () async {
                // Handle logout
                await FirebaseAuth.instance.signOut();
                // Navigate to login screen
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      );
  }
}