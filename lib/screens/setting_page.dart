import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'edit_profile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load the user data from Firebase and reload if needed
  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.reload();  // Reload the user data to ensure it is up to date
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Extract the name before @gmail.com (or any email domain)
    String userName = _user?.displayName ?? 'Your Name';
    String email = _user?.email ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the EditProfilePage when the user taps the profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              ).then((_) {
                // When returning from EditProfilePage, reload user data
                _loadUserData();
              });
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[400],
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),

          // Account section
          const SizedBox(height: 16),
          const Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),

          InkWell(
            onTap:(){
              Navigator.pushNamed(context, '/orders');
            },
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.black87),
              title: const Text('Orders'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          InkWell(
            onTap:(){
            },
            child: ListTile(
              leading: const Icon(Icons.assignment_return, color: Colors.black87),
              title: const Text('Returns'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          InkWell(
            onTap:(){
            },
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.black87),
              title: const Text('Addresses'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          InkWell(
            onTap:(){

            },
            child: ListTile(
              leading: const Icon(Icons.payment, color: Colors.black87),
              title: const Text('Payment'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          InkWell(
            onTap:(){

            },
            child: ListTile(
              leading: const Icon(Icons.wallet, color: Colors.black87),
              title: const Text('Wallet'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          const Divider(),

          // Settings section
          const SizedBox(height: 16),
          const Text('Setting', style: TextStyle(fontWeight: FontWeight.bold)),

          InkWell(
            onTap:(){

            },
            child: ListTile(
              leading: const Icon(Icons.language, color: Colors.black87),
              title: const Text('Language'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          InkWell(
            onTap:(){

            },
            child: ListTile(
              leading: const Icon(Icons.location_city, color: Colors.black87),
              title: const Text('Location'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),
          const Divider(),

          // Help & Support section
          const SizedBox(height: 16),
          const Text('Help & Support', style: TextStyle(fontWeight: FontWeight.bold)),
          InkWell(
            onTap:(){

            },
            child: ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.black87),
              title: const Text('Get Help'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),

          InkWell(
            onTap:(){

            },
            child: ListTile(
              leading: const Icon(Icons.question_answer, color: Colors.black87),
              title: const Text('FAQ'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ),
          const Divider(),

          // Logout option
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Log Out', style: TextStyle(color: Colors.redAccent)),
            onTap: () async {
              // Handle logout
              await FirebaseAuth.instance.signOut();
              // Navigate to login screen
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
