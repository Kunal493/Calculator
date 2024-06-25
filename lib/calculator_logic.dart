import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  static String evaluate(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression.replaceAll('x', '*'));
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
