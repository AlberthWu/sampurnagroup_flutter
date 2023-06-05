import 'package:intl/intl.dart';

String formatCurrency(int value) {
  var formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: '');
  return formatCurrency.format(value);
}
