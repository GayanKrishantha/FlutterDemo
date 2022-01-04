import 'package:test_f_one/controllers/time_tracker.dart';
import 'package:test_f_one/data/model/moment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TimeTrackerProvider {
  //List<Momenta> momenta = [];
  List<MomentArguments> momentArgs = [];

  List<MomentArguments> processResponse(List<Momenta> momenta) {
    for (Momenta content in momenta) {
      momentArgs.add(MomentArguments(false, content));
    }
    debugPrint('RESPONSE COUNT ************* ${momentArgs.length}');
    return momentArgs;
  }

  String dateFormatter(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    String formattedDate = DateFormat('EEEE DD MMM').format(tempDate);
    return formattedDate;
  }
}
