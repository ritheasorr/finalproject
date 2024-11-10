import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccountsDrawerHeaderWidget extends StatelessWidget {
  const UserAccountsDrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final user = snapshot.data;
          return UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Text(user?.email ?? 'Unknown'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent
            ),
          );
        }
      },
    );
  }
}