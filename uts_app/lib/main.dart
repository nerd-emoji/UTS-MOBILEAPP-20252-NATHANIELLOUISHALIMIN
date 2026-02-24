import 'package:flutter/material.dart';

import 'Login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6B4FB6),
      ),
      home: const LoginScreen(),
    );
  }
}
