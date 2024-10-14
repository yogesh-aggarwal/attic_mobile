import 'package:intl/intl.dart';

String numberToCurrency(String locale, double number, {int decimalDigits = 0}) {
  return NumberFormat.simpleCurrency(
    locale: locale,
    decimalDigits: decimalDigits,
  ).format(number);
}

String numberToPercentage(double number, {int decimalDigits = 0}) {
  return '${NumberFormat.decimalPattern().format(number)}%';
}
