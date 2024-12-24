import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../result_screen/results_screen.dart';
import 'cubit/input_screen_cubit.dart';
import 'cubit/input_screen_state.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _initialSpeedController = TextEditingController();
  final _finalSpeedController = TextEditingController();
  final _timeController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khen'),
        leading: IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            Navigator.pushNamed(context, '/result');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<InputScreenCubit, InputScreenState>(
          listener: (context, state) {
            if (state is CalculatedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Ускорение: ${state.acceleration.toStringAsFixed(2)} м/с²'
                    )
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _initialSpeedController,
                    decoration: const InputDecoration(
                        labelText: 'Начальная скорость (м/с)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Введите начальную скорость';
                      if (double.tryParse(value) == null) return 'Введите число';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _finalSpeedController,
                    decoration: const InputDecoration(
                        labelText: 'Конечная скорость (м/с)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Введите конечную скорость';
                      if (double.tryParse(value) == null) return 'Введите число';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _timeController,
                    decoration: const InputDecoration(labelText: 'Время (с)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Введите время';
                      final double? time = double.tryParse(value);
                      if (time == null || time <= 0) return 'Введите корректное время';
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      const Expanded(
                          child: Text('Согласен на обработку данных')),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_isChecked) {
                        final double initialSpeed =
                        double.parse(_initialSpeedController.text);
                        final double finalSpeed =
                        double.parse(_finalSpeedController.text);
                        final double time = double.parse(_timeController.text);

                        context.read<InputScreenCubit>().calculateAcceleration(
                            initialSpeed, finalSpeed, time);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Согласитесь на обработку данных.')),
                        );
                      }
                    },
                    child: const Text('Рассчитать'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}