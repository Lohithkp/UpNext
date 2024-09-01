import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back to the previous page (Login Page)
            },
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Message: "Register to the UpNext app"
              const Text(
                'Register to the UpNext app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // Name text field
              const TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: 'Enter Full Name',
                  border: UnderlineInputBorder(),
                  filled: false, // Remove background color
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0), // Adjust padding to align the text
                ),
                obscureText: false,
              ),
              const SizedBox(height: 18),

              // Email text field
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: 'Enter Email',
                  border: UnderlineInputBorder(), // Only bottom line
                  filled: false, // Remove background color
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0), // Adjust padding to align the text
                ),
                obscureText: false,
              ),
              const SizedBox(height: 18),
              // Mobile Number text field
              TextField(
                controller: _mobileController,
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  hintText: 'Mobile Number',
                  border: UnderlineInputBorder(),
                  filled: false,
                  fillColor: Colors.grey, // Optional: background color
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 18),

              // Password text field
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: 'Password',
                  border: UnderlineInputBorder(),
                  filled: false,
                  fillColor: Colors.grey, // Optional: background color
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 18),

              // Confirm Password text field
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  border: UnderlineInputBorder(), // Only bottom line
                  filled: false, // Remove background color
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0), // Adjust padding to align the text
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40),

              // Register button
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: 'UpNext'),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    print(error.toString());
                  });
                },
                child: const Text('Register'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
