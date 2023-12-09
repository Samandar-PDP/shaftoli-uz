import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const NetworkingApp());
}
class NetworkingApp extends StatelessWidget {
  const NetworkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}
