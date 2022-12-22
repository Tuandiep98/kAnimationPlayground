import 'package:flutter/material.dart';

extension StringExtension on String {
  bool isNullOrEmpty() {
    return this == null || this == '';
  }

  double toTimeOfDayAsDouble() {
    TimeOfDay _time = TimeOfDay(
        hour: int.parse(this.split(":")[0]),
        minute: int.parse(this.split(":")[1]));
    return _time.hour + _time.minute / 60.0;
  }
}
