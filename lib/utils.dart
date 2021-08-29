import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    // ignore: unnecessary_null_comparison
    if (date == null) return null;
    return date.toUtc();
  }
}
