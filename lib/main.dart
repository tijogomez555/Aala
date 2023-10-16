import 'package:aala/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {'/main': (context) => LoginPage()},
    );
  }
}
