import 'package:eg_nid/eg_nid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check Female', () {
    var nIDInfo = NIDInfo(nid: "20002220200487");
    expect(nIDInfo.sex, "Female");
  });
  test('Check Male', () {
    var nIDInfo = NIDInfo(nid: "20002220200437");
    expect(nIDInfo.sex, "Male");
  });
  test('Check invalid long nid', () {
    try {
      NIDInfo(nid: "200022202sss00437");
      expect(false, true);
    } catch (e) {
      expect(e, "wrong nid format");
    }
  });
  test('Check invalid month ', () {
    try {
      NIDInfo(nid: "20032220200437");
      expect(false, true);
    } catch (e) {
      expect(e, "Wrong day or month values");
    }
  });

  test('Check invalid day ', () {
    try {
      NIDInfo(nid: "20032500200437");
      expect(false, true);
    } catch (e) {
      expect(e, "Wrong day or month values");
    }
  });

  test('Check valid city', () {
    var nIDInfo = NIDInfo(nid: "20002220200487");
    expect(nIDInfo.city, "Alexandria");
  });
  test('Check invalid city ID', () {
    try {
      NIDInfo(nid: "20002229900487");
      expect(false, true);
    } catch (e) {
      expect(e, "Wrong city ID");
    }
  });
  test('Check valid Date', () {
    var nIDInfo = NIDInfo(nid: "20002220200487");
    expect(nIDInfo.birthDay, DateTime(1900, 2, 22));
  });
}
