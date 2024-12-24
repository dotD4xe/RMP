import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double acceleration;

  const ResultScreen({super.key, required this.acceleration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результаты'),
      ),
      body: Center(
        child: Text(
          'Ускорение: ${acceleration.toStringAsFixed(2)} м/с²',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
