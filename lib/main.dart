
import 'package:finalproject/screens/cart_page.dart';
import 'package:finalproject/providers/cart_provider.dart';
import 'package:finalproject/screens/order_history_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'widgets/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';

import 'screens/register_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/discovery_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Starter Template',
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/login',
        routes: {
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/home': (context) => HomePageNavigator(),
          '/orders': (context) => OrderHistoryPage(),
          '/categories': (context) => DiscoveryPage(),

        },
      ),
    );
  }
}

class HomePageNavigator extends StatefulWidget {
  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    DiscoveryPage(),
    const Center(child: Text('Upload Page Coming Soon')),
    CartPage(),
    const Center(child: Text('Profile Page Coming Soon')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBarExample(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),

    );
  }
}






