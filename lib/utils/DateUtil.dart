import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static Text formatDate(String date) {
    var dateParser = DateFormat('yyyy-MM-DD');
    var dateFormatter = DateFormat('MMMM dd, yyyy');
    try {
      return Text(dateFormatter.format(dateParser.parse(date)));
    } catch (e) {
      return Text("");
    }
  }
}