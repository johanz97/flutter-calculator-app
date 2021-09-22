part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathresult;
  final String firstnumber;
  final String secondnumber;
  final String operation;

  CalculatorState({
    this.firstnumber = '0',
    this.mathresult = '0',
    this.operation = '',
    this.secondnumber = '0',
  });

  CalculatorState copyWith({
    String? mathresult,
    String? firstnumber,
    String? secondnumber,
    String? operation,
  }) =>
      CalculatorState(
        firstnumber: firstnumber ?? this.firstnumber,
        mathresult: mathresult ?? this.mathresult,
        operation: operation ?? this.operation,
        secondnumber: secondnumber ?? this.secondnumber,
      );
}
