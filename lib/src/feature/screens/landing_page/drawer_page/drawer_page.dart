import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/routing_constants_names.dart';

class MyDrawer extends StatefulWidget {
  final User? user;

  const MyDrawer({Key? key, required this.user}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isLoggingOut = false; // Track logout state

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(widget.user?.displayName ?? 'User Name'),
            accountEmail: Text(widget.user?.email ?? 'user@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                widget.user?.displayName?.substring(0, 1) ?? 'U',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
            onTap: () {
              // Add action for info
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              setState(() {
                _isLoggingOut = true; // Set loading state to true
              });
              try {
                await FirebaseAuth.instance.signOut();
                // Optionally, add some delay to simulate loading
                await Future.delayed(Duration(seconds: 2));

                // Navigate to the login page using go_router
                context.goNamed(RoutingScreens
                    .loginPage); // Adjust the name based on your routing setup

                // Close the drawer
                Navigator.of(context).pop();
              } catch (e) {
                setState(() {
                  _isLoggingOut = false; // Reset loading state in case of error
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error during logout: $e')),
                );
              }
            },
          ),
          if (_isLoggingOut) // Show a loading indicator if logging out
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
