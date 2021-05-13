import 'package:intl/intl.dart';

class FlexiFuncGlobal {
  static checkPhoneNumberDeleteFirstNumber(String numberStr) {
    if (numberStr[0] == '0') {
      return numberStr.substring(1);
    }
    return numberStr;
  }

  static checkNumberThreeLengthWithDouble(number) {
    final formatter = new NumberFormat("#,##0.00");
    if (number != null) {
      return formatter.format(number);
    }
    return formatter.format(0);
  }

  static checkNumberThreeLengthWithInt(number) {
    final formatter = new NumberFormat("#,##0");
    if (number != null) {
      return formatter.format(number);
    }
    return formatter.format(0);
  }

  static formatDateTimeFunc(String dateTime, int number,
      {String languageCode}) {
    DateTime _dateTimeCovertFromString = DateTime.parse(dateTime).toLocal();
    var _getMonth = _dateTimeCovertFromString.month;
    var _getDay = _dateTimeCovertFromString.day;
    var _getYear = _dateTimeCovertFromString.year;
    var _getMonthKhmer = '';
    List _listOfMonthsKhmer = [
      "មករា",
      "កុម្ភៈ​",
      "មីនា",
      "មេសា",
      "ឧសភា​",
      "មិថុនា​",
      "កក្កដា​",
      "សីហា",
      "កញ្ញា​",
      "តុលា​",
      "វិច្ឆិកា​",
      "ធ្នូ​"
    ];
    if (languageCode == "khm") {
      for (int month = 0; month <= _listOfMonthsKhmer.length; month++) {
        if (_getMonth - 1 == month) {
          _getMonthKhmer = _listOfMonthsKhmer[month];
        }
      }
      return _getDay.toString() +
          " " +
          _getMonthKhmer +
          " " +
          _getYear.toString();
    } else {
      switch (number) {
        case 1:
          return DateFormat("dd MMM yyyy")
              .format(_dateTimeCovertFromString)
              .toString();
          break;
        case 2:
          return DateFormat("dd-MMM-yyyy")
              .format(_dateTimeCovertFromString)
              .toString();
          break;
        case 3:
          return DateFormat("dd MM yyyy")
              .format(_dateTimeCovertFromString)
              .toString();
          break;
        case 4:
          return DateFormat("dd-MM-yyyy")
              .format(_dateTimeCovertFromString)
              .toString();
          break;
        case 5:
          return DateFormat("dd MM yy")
              .format(_dateTimeCovertFromString)
              .toString();
          break;
        case 6:
          return DateFormat("dd-MM-yy")
              .format(_dateTimeCovertFromString)
              .toString();
          break;
        default:
      }
    }
  }
}
