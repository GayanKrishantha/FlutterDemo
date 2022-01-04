import 'package:test_f_one/providers/time_tracker_provider.dart';
import 'package:test_f_one/controllers/timeTrackerWidget.dart';
import 'package:test_f_one/custom_widgets/progress.dart';
import 'package:test_f_one/data/model/moment_model.dart';
import 'package:test_f_one/helpers/constants.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:test_f_one/helpers/utils.dart';
import 'package:flutter/material.dart';

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
    provider.value = provider.getValue();
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
        future: provider.value,
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
                  child: Text(Utils.dateFormatterWithString(value),
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
