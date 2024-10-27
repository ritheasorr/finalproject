import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';





class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color x = Colors.blue;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blueAccent,
        title: Text('Fenz'),
        actions: <Widget>[
          IconButton(
            icon:Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){}),
          IconButton(
              icon:Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: (){}),
        ],
      ),
      drawer: Drawer(
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
              color: Colors.red
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
      ),
      body: ListView(
        children: <Widget>[
          content(),
        ],
      ),
    );
  }
  Widget content(){
    return CarouselSlider(
      options:CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
      ),
      items: [
        'assets/images/first.png',
        'assets/images/first.png',
        'assets/images/first.png',
        'assets/images/first.png',
        'assets/images/first.png',
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            );
          },
        );
      }).toList(),
    );
  }
}