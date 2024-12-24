import 'package:flutter_bloc/flutter_bloc.dart';
import 'input_screen_state.dart';

class InputScreenCubit extends Cubit<InputScreenState> {
  InputScreenCubit() : super(InitialState());

  void calculateAcceleration(
      double initialSpeed, double finalSpeed, double time) {
    final double acceleration = (finalSpeed - initialSpeed) / time;
    emit(CalculatedState(acceleration));
  }
}
