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
                    margin:const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.grey[400],
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
                            SizedBox(height: 20),
                            Text(
                              'Log into your account',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 0.0
                                    )
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null) {
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
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.black),
                                obscureText: _ishidden,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueAccent,
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.0
                                      )
                                  ),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(color: Colors.white),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _ishidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _ishidden = !_ishidden;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
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
                                SizedBox(height: 20),

                                SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: ElevatedButton(
                                  onPressed: () {
                                    login();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    minimumSize: const Size.fromHeight(20),
                                  ),
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/reset-password');
                              },
                              child: Text(
                                'Have you forgot your password?',
                                style: TextStyle(
                                  color: Colors.black, // Hyperlink color
                                  fontSize: 16.0,
                                   fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Text(
                                "Don't have an account yet? Sign up" ,
                                style: TextStyle(
                                  color: Colors.black, // Hyperlink color
                                  fontSize: 16.0,
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