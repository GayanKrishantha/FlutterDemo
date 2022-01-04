import 'package:test_f_one/controllers/detailconteroller.dart';
import 'package:test_f_one/providers/tabbarprovider.dart';
import 'package:test_f_one/controllers/time_tracker.dart';
import 'package:test_f_one/custom_widgets/progress.dart';
import 'package:test_f_one/helpers/constants.dart';
import 'package:test_f_one/helpers/extension.dart';
import 'package:test_f_one/helpers/utils.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabBarProvider provider = TabBarProvider();
  late Map<String, List<MomentArguments>> array;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  initState() {
    super.initState();
    provider.value = provider.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E6E6E6"),
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
              return IndexedStack(
                index: _selectedIndex,
                children: [
                  const TimeTrackerScreen(),
                  DetailScreen(
                      list: Utils.filterByDateRange(provider.momentArgs))
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: 'Summary',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors().accent,
        onTap: _onItemTapped,
      ),
    );
  }

  bool get wantKeepAlive => true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
