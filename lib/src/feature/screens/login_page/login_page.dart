import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:up_next/src/constants/color_constants.dart';
import 'package:up_next/src/constants/routing_constants_names.dart';
import '../../../services/connectivity_service/internet_connectvity_service.dart';
import '../../../widget/snackbar_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // Track loading state

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 120, left: 16, right: 16, bottom: 16),
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
                          color: AppColorsConstant.customPrimaryColor,
                        ),
                      ),
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

                  // Login button with loading indicator
                  ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            bool hasConnection = await ConnectivityService()
                                .hasInternetConnection();
                            if (hasConnection) {
                              setState(() {
                                _isLoading = true; // Start loading
                              });

                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim());

                                // Show success message
                                SnackBarHelper.showSnackBarWidget(
                                  context,
                                  "Login successfully.",
                                  AppColorsConstant.customPrimaryColor,
                                );

                                // Delay for a couple of seconds before navigating
                                await Future.delayed(
                                    const Duration(seconds: 2));

                                // Navigate to the landing page
                                context.goNamed(RoutingScreens.landingPage);
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Something went wrong, try again")),
                                );
                              } finally {
                                setState(() {
                                  _isLoading = false; // Stop loading
                                });
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "No internet connection, try again")),
                              );
                            }
                          },
                    child: _isLoading
                        ? CircularProgressIndicator(
                            strokeWidth: 2,
                          )
                        : const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
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
        ],
      ),
    );
  }
}
