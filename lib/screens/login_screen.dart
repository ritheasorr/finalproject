import 'package:flutter/material.dart';
import 'package:finalproject/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  var form = GlobalKey<FormState>();

  login() {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      AuthService authService = AuthService();
      return authService.login(email, password).then((value) {
        FocusScope.of(context).unfocus();
        Navigator.of(context).pushNamed('/home');
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login successfully!')));
      }).catchError((error) {
        FocusScope.of(context).unfocus();
        String message = error.toString();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      });
    }
  }

  bool _ishidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 6),
              Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Added rounded corners to Card
                ),
                color: const Color(0xFFD0D6E1), // Changed Card color to light gray
                child: Form(
                  key: form,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Log into your account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Set title color to black
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white), // text color
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF13539E), // Set background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), // Added rounded corners
                                borderSide: BorderSide.none, // Removed border outline
                              ),
                              labelStyle: const TextStyle(color: Colors.white),
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please provide an email address.";
                              } else if (!value.contains('@')) {
                                return "Please provide a valid email address.";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white), // text color
                            obscureText: _ishidden,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF13539E), // Set background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), // Added rounded corners
                                borderSide: BorderSide.none, // Removed border outline
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.white),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _ishidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white, // Changed icon color to white
                                ),
                                onPressed: () {
                                  setState(() {
                                    _ishidden = !_ishidden;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide a password.';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters.';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              password = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Set button background color t
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Added rounded corners to button
                              ),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white, // Set button text color
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/reset-password');
                          },
                          child: const Text(
                            'Have you forgot your password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: const Text(
                            "Don't have an account yet? Sign up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
