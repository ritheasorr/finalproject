import 'package:finalproject/services/auth_service.dart';
import 'package:finalproject/services/firestore_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? userName;
  String? phoneNo;
  String? password;
  String? confirmPassword;

  var form = GlobalKey<FormState>();

  register() {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      if (password != confirmPassword) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password and Confirm Password do not match!'),
        ));
        return;
      }
      AuthService authService = AuthService();
      FirestoreService fsService = FirestoreService();
      return authService.register(email, password).then((value) {
        return fsService.addUser(email, userName, phoneNo).then((value) {
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('User Registered successfully!'),
          ));
        });
      }).catchError((error) {
        FocusScope.of(context).unfocus();
        String message = error.toString();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFD0D6E1), // Light gray background
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Register a new account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                buildTextFormField('Full Name', TextInputType.text, (value) {
                  if (value == null || value.isEmpty) return "Please provide a name.";
                  return null;
                }, (value) {
                  userName = value;
                }),
                SizedBox(height: 10),
                buildTextFormField('Phone Number', TextInputType.phone, (value) {
                  if (value == null || value.isEmpty) return "Please provide a phone number.";
                  return null;
                }, (value) {
                  phoneNo = value;
                }),
                SizedBox(height: 10),
                buildTextFormField('Email', TextInputType.emailAddress, (value) {
                  if (value == null || !value.contains('@')) return "Please provide a valid email.";
                  return null;
                }, (value) {
                  email = value;
                }),
                SizedBox(height: 10),
                buildTextFormField('Password', TextInputType.visiblePassword, (value) {
                  if (value == null || value.length < 6) return "Password must be at least 6 characters.";
                  return null;
                }, (value) {
                  password = value;
                }, obscureText: true),
                SizedBox(height: 10),
                buildTextFormField('Confirm Password', TextInputType.visiblePassword, (value) {
                  if (value == null || value.length < 6) return "Password must be at least 6 characters.";
                  return null;
                }, (value) {
                  confirmPassword = value;
                }, obscureText: true),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    // Navigate to the login screen
                  },
                  child: Text(
                    'Already have an account? Log In',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String label,
      TextInputType keyboardType,
      String? Function(String?) validator,
      void Function(String?) onSaved, {
        bool obscureText = false,
      }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white), // White text color
        filled: true,
        fillColor: Color(0xFF13539E), // Blue background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}

