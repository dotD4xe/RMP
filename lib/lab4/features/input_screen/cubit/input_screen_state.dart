
abstract class InputScreenState {}

class InitialState extends InputScreenState {}

class CalculatedState extends InputScreenState {
  final double acceleration;

  CalculatedState(this.acceleration);
}