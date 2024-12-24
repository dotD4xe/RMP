import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'input_screen_state.dart';

class InputScreenCubit extends Cubit<InputScreenState> {
  final GetStorage storage = GetStorage();

  InputScreenCubit() : super(InitialState());

  void calculateAcceleration(double initialSpeed, double finalSpeed, double time) {
    final double acceleration = (finalSpeed - initialSpeed) / time;
    emit(CalculatedState(acceleration));
    saveData(initialSpeed, finalSpeed, time, acceleration);
  }

  void saveData(double initialSpeed, double finalSpeed, double time, double acceleration) {
    final List<Map<String, dynamic>> results = storage.read<List<dynamic>>('results')
            ?.cast<Map<String, dynamic>>() ?? [];
    results.add({
      'initialSpeed': initialSpeed,
      'finalSpeed': finalSpeed,
      'time': time,
      'acceleration': acceleration,
    });
    storage.write('results', results);
  }

  List<Map<String, dynamic>> loadResults() {
    return storage.read<List<dynamic>>('results')
        ?.cast<Map<String, dynamic>>() ?? [];
  }

}
