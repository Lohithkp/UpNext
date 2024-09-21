import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_next/src/constants/routing_constants_names.dart';
import 'package:up_next/src/feature/screens/landing_page/landing_page.dart';
import '../../../../main.dart';
import '../reset_password_page/reset_password_page.dart';
import '../singn_up_page/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red, // Set the background color to red
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 120, left: 16, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App Name and Logo
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'assets/images/todo_1.png',
                      )), // Placeholder for the app logo
                  const SizedBox(height: 16),
                  const Text(
                    'UpNext',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Sign in with Google button
              ElevatedButton.icon(
                onPressed: () {
                  // Add Google Sign-In logic here
                },
                icon: const Icon(Icons.account_circle),
                label: const Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 25),

              // Email ID text field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password text field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RoutingScreens.forgotPassword);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 38),

              // Login button
              ElevatedButton(
                onPressed: () async {
                  // final email = _emailController.text;
                  // final password = _passwordController.text;
                  // DocumentSnapshot userDoc = await FirebaseFirestore.instance
                  //     .collection('users')
                  //     .doc(email)
                  //     .get();
                  // if (userDoc.exists) {
                  //   UserCredential userCredential =
                  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
                  //     email: email,
                  //     password: password,
                  //   );
                  // }
                  //
                  // FirebaseAuth.instance
                  //     .signInWithEmailAndPassword(
                  //         email: email, password: password)
                  //     .then((value) {
                  //   Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //       builder: (context) => const LandingPage(),
                  //     ),
                  //   );
                  // }).onError((error, stackTrace) {
                  //   _showErrorSnackBar("User name or password is incorrect");
                  // });
                  context.goNamed(RoutingScreens.landingPage);
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),

              // "Don't have an account? Sign up" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RoutingScreens.signupPage);
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
