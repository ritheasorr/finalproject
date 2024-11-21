//Ritheasor Code
// import 'package:finalproject/screens/cart_page.dart';
// import 'package:finalproject/screens/order_history_page.dart';
// import 'package:flutter/material.dart';
// import 'screens/home_page.dart';
// import 'widgets/bottom_bar.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'screens/login_screen.dart';
// import 'package:finalproject/screens/register_screen.dart';
// import 'package:finalproject/screens/reset_password_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int _selectedIndex = 0; // Track the selected index
//
//   // List of screens to display
//   final List<Widget> _screens = [
//     HomePage(),
//     CartPage(),
//     // Add your other screens here
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Starter Template',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//
//       home: LoginScreen(),
//       routes: {
//         '/home': (context) => Scaffold( // Wrap with Scaffold here
//           body: _screens[_selectedIndex],
//           bottomNavigationBar: BottomNavigationBarExample(
//             selectedIndex: _selectedIndex,
//             onItemTapped: _onItemTapped,
//           ),
//         ),
//         '/register': (context) => RegisterScreen(),
//         '/login': (context) => LoginScreen(),
//         '/reset-password': (context) => ResetPasswordScreen(),
//         '/orders': (context) => OrderHistoryPage(),
//       },
//     );
//   }
// }


//
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
        ),
        initialRoute: '/login',
        routes: {
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/home': (context) => HomePageNavigator(),
          '/orders': (context) => OrderHistoryPage(),
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
    const Center(child: Text('Search Page Coming Soon')),
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






