import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_next/src/constants/color_constants.dart';
import 'package:up_next/src/constants/routing_constants_names.dart';
import 'package:up_next/src/feature/screens/add_category_page/add_category_page.dart';
import 'package:up_next/src/feature/screens/landing_page/landing_page.dart';
import 'package:up_next/src/feature/screens/login_page/login_page.dart';
import 'package:up_next/src/feature/screens/reset_password_page/reset_password_page.dart';
import 'package:up_next/src/feature/screens/singn_up_page/sign_up_page.dart';
import 'package:up_next/src/feature/screens/splash_screen/splash_screen.dart';
import 'package:up_next/src/feature/screens/view_task_page/task_view_page.dart';
import 'package:up_next/src/setup_service_locator/service_locator.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        // Initial splash screen route
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/splashScreenPage',
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
        GoRoute(
          name: RoutingScreens.addCategoryPage,
          path: '/addCategoryPage',
          builder: (context, state) => const AddCategoryPage(),
        ),
        GoRoute(
          name: RoutingScreens.taskViewPage,
          path: '/taskViewPage',
          builder: (context, state) => TaskViewPage(
            userProfile: '',
            numberOfTasks: 1,
            taskProgress: 1.1,
            taskList: [],
          ),
        ),
      ],
    );

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          Future.delayed(Duration(seconds: 2), () {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _router.goNamed(RoutingScreens.landingPage);
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _router.goNamed(RoutingScreens.loginPage);
              });
            }
          });
        }

        return MaterialApp.router(
          routerConfig: _router,
          theme: ThemeData(
            primaryColor:
                AppColorsConstant.customPrimaryColor, // Set the primary color
            // You can also set other colors like accentColor, backgroundColor, etc.
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColorsConstant.customPrimaryColor,
              secondary: Colors.amber, // Example for secondary color
            ),
          ),
        );
      },
    );
  }
}
