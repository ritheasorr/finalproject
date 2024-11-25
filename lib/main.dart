import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'widgets/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'package:finalproject/screens/register_screen.dart';
import 'package:finalproject/screens/reset_password_screen.dart';
import 'package:finalproject/screens/discovery_page.dart';
import 'package:finalproject/screens/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // Track the selected index

  // List of screens to display
  final List<Widget> _screens = [
    HomePage(),
    // Add your other screens here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter Template',
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: LoginScreen(),
      routes: {
        '/home': (context) => Scaffold( // Wrap with Scaffold here
          body: _screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBarExample(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
        '/categories': (context) => DiscoveryPage(),
        '/My Account': (context) => SettingPage(),
      },
    );
  }
}