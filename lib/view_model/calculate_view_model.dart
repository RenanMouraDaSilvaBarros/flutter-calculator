import 'package:flutter/material.dart';
import 'package:calculate/services/calculate_service.dart';
import 'package:calculate/utils/business_rule.dart';

class CalculatorViewModel extends ChangeNotifier {
  String _displayExpression = "";
  String _firstOperand = "";
  String _secondOperand = "";
  String _operator = "";

  String get displayExpression => _displayExpression;

  void updateFirstOperand(String value) {
    _firstOperand += value;
    _updateDisplayExpression();
  }

  void updateOperator(String value) {
    _operator = value;
    _updateDisplayExpression();
  }

  void updateSecondOperand(String value) {
    _secondOperand += value;
    _updateDisplayExpression();
  }

  void clear() {
    _firstOperand = "";
    _secondOperand = "";
    _operator = "";
    _updateDisplayExpression();
  }

  void _updateDisplayExpression() {
    _displayExpression = "$_firstOperand$_operator$_secondOperand";
    notifyListeners();
  }

  void getResult() {
    if (_firstOperand.isNotEmpty &&
        _operator.isNotEmpty &&
        _secondOperand.isNotEmpty) {
      _displayExpression =
          CalculateService.execute(_operator, _firstOperand, _secondOperand);
      final resultCache = _displayExpression;
      clear();
      _firstOperand = formatDecimal(resultCache);
      _displayExpression = "$_firstOperand$_operator$_secondOperand";
    }
    notifyListeners();
  }

  void update(String value) {
    switch (value) {
      case "AC":
        clear();
        break;
      case "=":
        getResult();
        break;
      default:
        performOperation(value);
        break;
    }
  }

  void performOperation(String value) {
    if (!isConfig(value) &&
        isOperation(value) &&
        isValidFirstOperand(_firstOperand)) {
      updateOperator(value);
    } else if (isValidFirstOperand(_firstOperand + value) &&
        _operator.isEmpty) {
      updateFirstOperand(value);
    } else if (lastOperatingIsValid(value) && _operator.isNotEmpty) {
      updateSecondOperand(value);
    }
  }
}
