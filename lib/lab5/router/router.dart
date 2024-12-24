import 'package:flutter/cupertino.dart';

import 'package:labs/lab5/features/input_screen/input_screen.dart';
import 'package:labs/lab5/features/result_screen/results_screen.dart';
import 'package:labs/lab5/features/input_screen/input_screen_provider.dart';

final routes = {
  '/': (context) => const InputScreenProvider(),
  '/result': (context) => const ResultsScreen(),
};
