import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs/lab5/features/input_screen/cubit/input_screen_cubit.dart';
import 'package:labs/lab5/features/input_screen/cubit/input_screen_state.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputScreenCubit(),
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Результаты расчетов'),
      ),
      body: BlocBuilder<InputScreenCubit, InputScreenState>(
        builder: (context, state) {
          final results = context.read<InputScreenCubit>().loadResults();
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return ListTile(
                title: Text('Начальная скорость: ${result['initialSpeed']} м/с\n'
                    'Конечная скорость: ${result['finalSpeed']} м/с\n'
                    'Время: ${result['time']} с\n'
                    'Ускорение: ${result['acceleration']} м/с²'),
              );
            },
          );
        },
      ),
    ),
    );
  }
}
