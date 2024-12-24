import 'package:flutter/material.dart';
import 'package:labs/lab3/router/router.dart';

class CalculationApp extends StatelessWidget {
  const CalculationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}