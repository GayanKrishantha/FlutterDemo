import 'package:test_f_one/controllers/time_tracker.dart';
import 'package:test_f_one/data/model/moment_model.dart';
import 'package:test_f_one/helpers/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class TabBarProvider {
  late Future<Map<String, List<MomentArguments>>> value;
  late Map<String, List<MomentArguments>> array;
  List<MomentArguments> momentArgs = [];

  Future<Map<String, List<MomentArguments>>> getValue() async {
    await Future.delayed(const Duration(seconds: 3));
    return readJson();
  }

  Future<Map<String, List<MomentArguments>>> readJson() async {
    List<Momenta> list = [];
    try {
      final String response =
      await rootBundle.loadString('assets/locale/moments.json');
      final Map<String, dynamic> extractedData = json.decode(response);
      final List<dynamic> data = extractedData['moments'];
      list = data.map((e) => Momenta.fromJson(e)).toList();
      array = processResponse(list).groupBy((person) => person.momenta.date);
      return array;
    } catch (error) {
      debugPrint('$error');
    }
    return array;
  }

  List<MomentArguments> processResponse(List<Momenta> momenta) {
    for (Momenta content in momenta) {
      momentArgs.add(MomentArguments(false, content));
    }
    return momentArgs;
  }

  // String dateFormatter(String date) {
  //   DateTime tempDate = DateFormat(AppDateFormat().apiDateFormatter).parse(date);
  //   String formattedDate =
  //   DateFormat(AppDateFormat().appDateFormatter).format(tempDate);
  //   return formattedDate;
  // }
}
