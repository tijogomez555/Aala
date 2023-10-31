import 'package:aala/core/firebase/auth_page.dart';
import 'package:aala/src/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'src/views/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {'/main': (context) => AuthPage()},
    );
  }
}
