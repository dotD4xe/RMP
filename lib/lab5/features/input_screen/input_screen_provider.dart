import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/input_screen_cubit.dart';
import 'input_screen.dart';

class InputScreenProvider extends StatelessWidget {
  const InputScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InputScreenCubit(),
        child: const InputScreen(),
      );
  }
}
