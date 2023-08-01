import 'package:flutter/material.dart';
import 'lessons/basic_dependency_injection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicDependencyInjectionPage(),
    );
  }
}
