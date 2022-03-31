import 'package:eg_nid/src/validator.dart';

import 'constants.dart';

class Mapper {
  String getCityName(String cityID) {
    if (citiesIDMap[cityID] == null) {
      throw ("Wrong city ID");
    }
    return citiesIDMap[cityID] ?? "Wrong NID";
  }

  String getSex(String sexCode) =>
      int.parse(sexCode) % 2 == 0 ? "Female" : "Male";

  DateTime getBirthDay(String dayMonthYear) {
    int day, month, year;
    day = _getDay(dayMonthYear.substring(5, 7));
    month = _getMonth(dayMonthYear.substring(3, 5));
    year = _getYear(dayMonthYear.substring(0, 3));

    if (!Validator().isValidDayMonth(day, month, year)) {
      throw ("Wrong day or month values");
    }
    return DateTime(year, month, day);
  }

  int _getDay(String dayText) => int.parse(dayText);

  int _getMonth(String monthText) => int.parse(monthText);

  int _getYear(String yearText) {
    String millenniumID = yearText.substring(0, 1);
    String decade = yearText.substring(1, 3);
    print(int.parse(decade));
    return millenniumsIDMap[millenniumID]! * 100 + int.parse(decade);
  }
}
