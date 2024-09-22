import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_next/src/constants/color_constants.dart';
import 'package:up_next/src/constants/routing_constants_names.dart';
import 'package:up_next/src/util/shared_preference_util.dart';

import '../login_page/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () async {
        // Ensure that the context is still mounted before navigating
        if (context.mounted) {
          final bool isLoggedIn = await SharedPreferenceData().isLoggedIn();
          if (false) {
            context.goNamed(RoutingScreens.landingPage);
          } else {
            context.goNamed(RoutingScreens.loginPage);
          }
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              width: 50,
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
      ),
    );
  }
}
