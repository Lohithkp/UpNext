import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Reset Password",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailController.text)
                      .then((value) {
                    Navigator.pop(context);
                  }).onError((error, stackTrace) {
                    print(error.toString());
                  });
                },
                child: const Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 125),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
