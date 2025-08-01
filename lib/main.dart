import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/portfolio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: 'AIzaSyApTzlEHB2XtgbJJXXQL4lugb220OfEiaE',
            appId: '1:396965021347:web:96df045418b9917c70e116',
            messagingSenderId: '396965021347',
            projectId: 'portfolio-82c56'));
  } catch (e) {
    print('Firebase Error ${e}');
  }
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
