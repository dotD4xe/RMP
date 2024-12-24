import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Khen D.D'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              buildContainer(Icons.adb_outlined, Colors.red),
              buildContainer(Icons.star, Colors.green),
              buildContainer(Icons.adb_outlined, Colors.purple),
              buildContainer(Icons.star, Colors.orange),
              buildContainer(Icons.adb_outlined, Colors.blue),
              buildContainer(Icons.star, Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(IconData icon, Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
