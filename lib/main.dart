import 'package:flutter/material.dart';
import 'package:minimalsocial_app/auth/login_or_register.dart';
import 'package:minimalsocial_app/theme/dark_mode.dart';
import 'package:minimalsocial_app/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
