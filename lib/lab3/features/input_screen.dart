import 'package:flutter/material.dart';

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

  void _calculateAndNavigate(BuildContext context) {
    if (_formKey.currentState!.validate() && _isChecked) {
      final double initialSpeed = double.parse(_initialSpeedController.text);
      final double finalSpeed = double.parse(_finalSpeedController.text);
      final double time = double.parse(_timeController.text);

      final double acceleration = (finalSpeed - initialSpeed) / time;

      Navigator.pushNamed(
        context,
        '/result',
        arguments: acceleration,
      );
    } else if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Согласитесь на обработку данных.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _initialSpeedController,
                decoration: const InputDecoration(labelText: 'Начальная скорость (м/с)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите начальную скорость';
                  if (double.tryParse(value) == null) return 'Введите число';
                  return null;
                },
              ),
              TextFormField(
                controller: _finalSpeedController,
                decoration: const InputDecoration(labelText: 'Конечная скорость (м/с)'),
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
                  const Expanded(child: Text('Согласен на обработку данных')),
                ],
              ),
              ElevatedButton(
                onPressed: () => _calculateAndNavigate(context),
                child: const Text('Рассчитать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}