import 'package:test_f_one/controllers/detailconteroller.dart';
import 'package:test_f_one/controllers/time_tracker.dart';
import 'package:test_f_one/helpers/constants.dart';
import 'package:test_f_one/helpers/extension.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MomentArguments> momentArgs = [];
    return Scaffold(
      backgroundColor: HexColor("#E6E6E6"),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [TimeTrackerScreen(), DetailScreen()],
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
