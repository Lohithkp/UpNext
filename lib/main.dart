import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:up_next/src/constants/color_constants.dart';
import 'package:up_next/src/feature/screens/splash_screen/splash_screen.dart';
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
    return MaterialApp(
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
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
