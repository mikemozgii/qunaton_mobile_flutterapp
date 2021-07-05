import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

DateTime fromUnixTime(Int64 seconds) {
  if (seconds == 0) return null;

  return DateTime.fromMicrosecondsSinceEpoch(seconds.toInt() * 1000000);
}

Int64 toUnixTime(DateTime date) {
  return Int64((date.toUtc().millisecondsSinceEpoch / 1000).round());
}

Int64 toUnixTimeWithoutOrganization(DateTime date) {
  return Int64((date.millisecondsSinceEpoch / 1000).round());
}

InputDecoration textFieldDecoration(String labelText,
    {UnderlineInputBorder disabledBorder}) {
  return InputDecoration(
    labelText: labelText,
    disabledBorder: disabledBorder,
    contentPadding: EdgeInsets.symmetric(vertical: 0),
  );
}
