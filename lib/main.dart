import 'package:flutter/material.dart';
import 'Screens/portfolio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meet Mevada | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xff0e0f1a),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
          titleLarge: TextStyle(color: Color(0xFF64FFDA), fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}
