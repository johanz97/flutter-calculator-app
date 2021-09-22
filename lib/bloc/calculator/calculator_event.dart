part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;
  AddNumber(this.number);
}

class ChangeNegativePositive extends CalculatorEvent {}

class DeleteLastNumber extends CalculatorEvent {}

class AddOperation extends CalculatorEvent {
  final String operation;
  AddOperation(this.operation);
}

class CalculateResult extends CalculatorEvent {}
