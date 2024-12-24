import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Khen D.D'),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Image.network(
              'https://www.jrebel.com/sites/default/files/image/2021-01/what%20is%20kotlin%20banner%20image.png',
            ),
          ),
        ),
      ),
    );
  }
}
