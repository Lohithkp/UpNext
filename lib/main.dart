import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_next/src/constants/color_constants.dart';
import 'package:up_next/src/constants/routing_constants_names.dart';
import 'package:up_next/src/feature/screens/landing_page/landing_page.dart';
import 'package:up_next/src/feature/screens/login_page/login_page.dart';
import 'package:up_next/src/feature/screens/reset_password_page/reset_password_page.dart';
import 'package:up_next/src/feature/screens/singn_up_page/sign_up_page.dart';
import 'package:up_next/src/feature/screens/splash_screen/splash_screen.dart';
import 'package:up_next/src/setup_service_locator/service_locator.dart';
import 'package:up_next/src/util/shared_preference_util.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferenceData _sharedPreferenceData = SharedPreferenceData();
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) async {
            final bool isLoggedIn = await SharedPreferenceData().isLoggedIn();
            if (true) {
              return '/landingPage';
            } else {
              return '/';
            }
          },
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: RoutingScreens.loginPage,
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: RoutingScreens.forgotPassword,
          path: '/forgotPassword',
          builder: (context, state) => const ResetPasswordPage(),
        ),
        GoRoute(
          name: RoutingScreens.signupPage,
          path: '/signup',
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          name: RoutingScreens.landingPage,
          path: '/landingPage',
          builder: (context, state) => const LandingPage(),
        ),
      ],
    );
    return MaterialApp.router(
      routerConfig: _router,
      title: 'UpNext',
      theme: ThemeData(
        primaryColor:
            ColorsConstant.customPrimaryColor, // Set the primary color
        // You can also set other colors like accentColor, backgroundColor, etc.
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorsConstant.customPrimaryColor,
          secondary: Colors.amber, // Example for secondary color
        ),
      ),
    );
  }
}
