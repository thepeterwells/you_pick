import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static Text formatDate(String date) {
    var dateParser = DateFormat('yyyy-MM-DD');
    var dateFormatter = DateFormat('MMMM dd, yyyy');
    var formattedDate = dateFormatter.format(dateParser.parse(date));
    return Text(formattedDate);
  }
}