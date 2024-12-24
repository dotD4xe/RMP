import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs/lab5/features/result_screen/results_screen.dart';

import '../../../lab4/features/input_screen/cubit/input_screen_cubit.dart';

class InputScreenProvider extends StatelessWidget {
  const InputScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputScreenCubit(),
      child: const ResultsScreen(),
    );
  }
}
