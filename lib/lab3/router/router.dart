import 'package:flutter/cupertino.dart';
import '../features/input_screen.dart';
import '../features/result_screen.dart';

final routes = {
  '/': (context) => const InputScreen(),
  '/result': (context) => ResultScreen(
    acceleration: ModalRoute.of(context)!.settings.arguments as double,
  ),
};
