import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/input_screen/cubit/input_screen_cubit.dart';
import 'features/input_screen/input_screen.dart';

class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InputScreenCubit(),
        child: const InputScreen(),
      );
  }
}
