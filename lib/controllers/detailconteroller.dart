import 'package:test_f_one/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List _peopleData = List.generate(10, (index) {
    return {"name": "Paracetamol", "age": "2 stuck, 40 mg"};
  });

  // Item of the ListView
  Widget _listItem(index) {
    return Container(
        padding: const EdgeInsets.only(
            left: Dimensions.pX10, right: Dimensions.pX10),
        child: Card(
          child: ListTile(
            title: Text(_peopleData[index]['name'].toString(),
                style: AppTheme().titleBlack),
            subtitle: Text(_peopleData[index]['age'].toString(),
                style: AppTheme().subTitleBlack),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().primary,
        appBar: AppBar(
          backgroundColor: AppColors().primary,
          title: const Text('Summary'),
          titleTextStyle: AppTheme().appTitle,
        ),
        body: ListView.builder(
            itemCount: _peopleData.length,
            itemBuilder: (_, index) {
              if (index == 0) {
                return Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: Dimensions.pX20,
                            right: Dimensions.pX10,
                            top: Dimensions.pX16,
                            bottom: Dimensions.pX10),
                        color: AppColors().primary,
                        child: Text(
                            'Amount of medicines taken in the week of the 7th of January,',
                            style: AppTheme().appSubTitle)),
                  ],
                );
              }
              return _listItem(index);
            }));
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
