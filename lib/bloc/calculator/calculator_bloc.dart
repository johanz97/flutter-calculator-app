import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is ResetAC) {
      yield* this._resetAC();
    } else if (event is AddNumber) {
      yield* _addNumber(event.number);
    } else if (event is ChangeNegativePositive) {
      yield state.copyWith(
          mathresult: (state.mathresult.contains('-'))
              ? state.mathresult.replaceFirst('-', '')
              : '-' + state.mathresult);
    } else if (event is DeleteLastNumber) {
      print(state.mathresult.length);
      yield state.copyWith(
          mathresult: (state.mathresult.length < 2 ||
                  (state.mathresult.length == 2 &&
                      state.mathresult.contains('-')))
              ? '0'
              : state.mathresult.substring(0, state.mathresult.length - 1));
    } else if (event is AddOperation) {
      yield state.copyWith(
          firstnumber: state.mathresult,
          mathresult: '0',
          operation: event.operation);
    } else if (event is CalculateResult) {
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _addNumber(String number) async* {
    String result = number;
    if (state.mathresult == '0') {
      if (number == '.') result = state.mathresult + number;
    } else {
      if (state.mathresult.contains('.') && number == '.') {
        result = state.mathresult;
      } else {
        result = state.mathresult + number;
      }
    }
    yield state.copyWith(mathresult: result);
  }

  Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState(
        firstnumber: '0', mathresult: '0', secondnumber: '0', operation: '');
  }

  Stream<CalculatorState> _calculateResult() async* {
    final double num1 = double.parse(state.firstnumber);
    final double num2 = double.parse(state.mathresult);
    switch (state.operation) {
      case '+':
        yield state.copyWith(
            mathresult: '${num1 + num2}', secondnumber: state.mathresult);
        break;
      case '-':
        yield state.copyWith(
            mathresult: '${num1 - num2}', secondnumber: state.mathresult);
        break;
      case 'X':
        yield state.copyWith(
            mathresult: '${num1 * num2}', secondnumber: state.mathresult);
        break;
      case '/':
        if (num2 != 0)
          yield state.copyWith(
              mathresult: '${num1 / num2}', secondnumber: state.mathresult);
        else
          yield state.copyWith(secondnumber: 'ERROR');
        break;
      default:
        state;
    }
  }
}
