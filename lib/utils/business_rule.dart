const List<String> OPERATORS = ['+', '-', 'x', '/'];
const List<String> CONFIG = ['AC', '='];

bool isOperation(String operation) {
  return OPERATORS.contains(operation);
}

bool isConfig(String operation) {
  return CONFIG.contains(operation);
}

String formatDecimal(String expression) {
  int point = expression.indexOf('.');

  if (point != -1) {
    String next = expression[point + 1];
    if (next == '0') {
      return expression.substring(0, point);
    }
  }
  return expression;
}

bool isValidFirstOperand(String value) {
  //
  try {
    double.parse(value);
    return true;
  } catch (e) {
    if (value == "-") {
      return true;
    }
    return false;
  }
}

bool lastOperatingIsValid(String value) {
  try {
    double.parse(value);
    return true;
  } catch (e) {
    return false;
  }
}
