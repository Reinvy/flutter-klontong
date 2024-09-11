import 'package:intl/intl.dart';

class LocalizationUtils {
  static String formatRp(int value) {
    final formatNumber = NumberFormat('Rp #,##0', "id_ID");
    final formatedNumber = formatNumber.format(value);
    return formatedNumber;
  }
}
