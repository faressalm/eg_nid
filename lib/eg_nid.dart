library eg_nid;

import 'package:eg_nid/src/mapper.dart';
import 'package:eg_nid/src/validator.dart';

class NIDInfo {
  late String city;
  late String sex;
  late DateTime birthDay;

  NIDInfo({required String nid}) {
    !Validator().isValidNID(nid) ? throw ("wrong nid format") : {};
    Mapper mapper = Mapper();
    birthDay = mapper.getBirthDay(nid.substring(0, 7));
    city = mapper.getCityName(nid.substring(7, 9));
    sex = mapper.getSex(nid.substring(12, 13));
  }
}
