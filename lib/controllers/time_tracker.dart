import 'package:test_f_one/providers/time_tracker_provider.dart';
import 'package:test_f_one/controllers/timeTrackerWidget.dart';
import 'package:test_f_one/custom_widgets/progress.dart';
import 'package:test_f_one/data/model/moment_model.dart';
import 'package:test_f_one/helpers/extension.dart';
import 'package:test_f_one/helpers/constants.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class TimeTrackerScreen extends StatefulWidget {
  const TimeTrackerScreen({Key? key}) : super(key: key);

  @override
  _TimeTrackerScreenState createState() => _TimeTrackerScreenState();
}

class _TimeTrackerScreenState extends State<TimeTrackerScreen> {
  TimeTrackerProvider provider = TimeTrackerProvider();
  bool isExpand = false;
  late Map<String, List<MomentArguments>> array;

  @override
  initState() {
    super.initState();
    _value = getValue();
  }

  late Future<Map<String, List<MomentArguments>>> _value;
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
      array =
          provider.processResponse(list).groupBy((person) => person.momenta.date);
      return array;
    } catch (error) {
      debugPrint('$error');
    }
    return array;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primary,
      appBar: AppBar(
          title: const Text("Track Medicine"),
          backgroundColor: AppColors().primary,
          titleTextStyle: AppTheme().appTitle),
      body: FutureBuilder<Map<String, List<MomentArguments>>>(
        future: _value,
        builder: (
          BuildContext context,
          AsyncSnapshot<Map<String, List<MomentArguments>>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressWidget();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return GroupedListView<MomentArguments, String>(
                stickyHeaderBackgroundColor: AppColors().primary,
                elements: provider.momentArgs,
                groupBy: (element) => element.momenta.date,
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) =>
                    item1.momenta.date.compareTo(item2.momenta.date),
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.fromLTRB(Dimensions.pX14,
                      Dimensions.pX24, Dimensions.pX14, Dimensions.pX14),
                  child: Text(provider.dateFormatter(value),
                      style: AppTheme().titleDate),
                ),
                itemBuilder: (context, element) {
                  return TimeTrackerWidget(item: element);
                },
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
}

class MomentArguments {
  bool isExpand;
  Momenta momenta;
  MomentArguments(this.isExpand, this.momenta);
}
