import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calculadora/bloc/calculator/calculator_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class ResultsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state.firstnumber == '0' && state.secondnumber == '0') {
          return MainResultText(
              text: state.mathresult.endsWith('.0')
                  ? state.mathresult.substring(0, state.mathresult.length - 2)
                  : state.mathresult);
        }

        if (state.firstnumber != '0' && state.secondnumber == '0') {
          return Column(
            children: [
              SubResult(text: state.firstnumber),
              SubResult(text: state.operation),
              SubResult(text: ''),
              LineSeparator(),
              MainResultText(
                  text: state.mathresult.endsWith('.0')
                      ? state.mathresult
                          .substring(0, state.mathresult.length - 2)
                      : state.mathresult),
            ],
          );
        }
        return Column(
          children: [
            SubResult(
                text: state.firstnumber.endsWith('.0')
                    ? state.firstnumber
                        .substring(0, state.firstnumber.length - 2)
                    : state.secondnumber),
            SubResult(text: state.operation),
            SubResult(
                text: state.secondnumber.endsWith('.0')
                    ? state.secondnumber
                        .substring(0, state.secondnumber.length - 2)
                    : state.secondnumber),
            LineSeparator(),
            MainResultText(
                text: state.mathresult.endsWith('.0')
                    ? state.mathresult.substring(0, state.mathresult.length - 2)
                    : state.mathresult),
          ],
        );
      },
    );
  }
}
