class CalculateService {
  static double sum(double numberOne, double numberTwo) =>
      numberOne + numberTwo;

  static double subtract(double numberOne, double numberTwo) =>
      numberOne - numberTwo;

  static double multiply(double numberOne, double numberTwo) =>
      numberOne * numberTwo;

  static double divide(double numberOne, double numberTwo) {
    try {
      return numberOne / numberTwo;
    } catch (error) {
      rethrow;
    }
  }

  static String execute(String operation, String numberOne, String numberTwo) {
    String result = "";
    switch (operation) {
      case '+':
        result = sum(double.parse(numberOne), double.parse(numberTwo))
            .toStringAsFixed(5);
        break;
      case '-':
        result = subtract(double.parse(numberOne), double.parse(numberTwo))
            .toStringAsFixed(5);
        break;
      case 'x':
        result = multiply(double.parse(numberOne), double.parse(numberTwo))
            .toStringAsFixed(5);
        break;
      case '/':
        result = divide(double.parse(numberOne), double.parse(numberTwo))
            .toStringAsFixed(5);
        break;
    }
    return result;
  }
}
