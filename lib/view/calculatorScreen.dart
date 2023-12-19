// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:core';
import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/view_model/calculate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Widget _row(
      {required List<String> numbers,
      required List<String> operator,
      required CalculatorViewModel viewModel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        numbers.length + operator.length,
        (e) {
          final isOperator = e >= numbers.length;
          return isOperator
              ? DigitButton(
                  color: Colors.orange,
                  number: operator[e - numbers.length],
                  onChanged: (value) {
                    viewModel.update(value);
                  },
                )
              : DigitButton(
                  color: Colors.grey.withOpacity(0.6),
                  number: numbers[e],
                  onChanged: (value) {
                    viewModel.update(value);
                  },
                );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);
    const space = SizedBox(height: 5);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.33,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: const AlignmentDirectional(1, 0.1),
                      child: Consumer<CalculatorViewModel>(
                          builder: (context, model, _) {
                        return Text(
                          model.displayExpression,
                          style: const TextStyle(
                              fontSize: 60, color: Colors.white),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              _row(
                  numbers: ['1', '2', '3'],
                  operator: ['+'],
                  viewModel: viewModel),
              space,
              _row(
                  numbers: ['4', '5', '6'],
                  operator: ['-'],
                  viewModel: viewModel),
              space,
              _row(
                  numbers: ['7', '8', '9'],
                  operator: ['x'],
                  viewModel: viewModel),
              space,
              _row(
                  numbers: ['0'],
                  operator: ['AC', '=', '/'],
                  viewModel: viewModel),
            ],
          ),
        ),
      ),
    );
  }
}
