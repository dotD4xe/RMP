import 'package:flutter/material.dart';
import 'screens/nasa_screen.dart';

void main() {
  runApp(const NasaApp());
}

class NasaApp extends StatelessWidget {
  const NasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mars',
      home: NasaScreen(),
    );
  }
}
