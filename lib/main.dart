import 'package:flutter/material.dart';

import 'features/splash_screen_feature/presentation/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orders Delivery',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
        useMaterial3: true, 
      ),
      home: const SplashScreen(), 
    );
  }
}
