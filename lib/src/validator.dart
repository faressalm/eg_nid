class Validator {
  bool isValidNID(String nid) {
    return nid.length == 14 && _isInteger(nid);
  }

  bool _isInteger(String str) {
    return int.tryParse(str) != null;
  }

  bool isValidDayMonth(day, month, year) {
    return month > 0 &&
        month <= 12 &&
        day > 0 &&
        day <= _daysInMonth(month, year);
  }

  int _daysInMonth(int month, int year) {
    switch (month) {
      case 2:
        return ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
            ? 29
            : 28;
      case 9:
      case 4:
      case 6:
      case 11:
        return 30;
      default:
        return 31;
    }
  }
}
