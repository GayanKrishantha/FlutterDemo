import 'package:test_f_one/data/model/medicine_model.dart';
import 'package:test_f_one/helpers/constants.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  List<Medicines> list = [];

  DetailScreen({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    _setHeaderValue(),
                  ],
                );
              }
              return _listItem(widget.list[index]);
            }));
  }

  Widget _listItem(Medicines arg) {
    return Container(
        padding: const EdgeInsets.only(
            left: Dimensions.pX10, right: Dimensions.pX10),
        child: Card(
          child: ListTile(
            title: Text(arg.name, style: AppTheme().titleBlack),
            subtitle: Text(arg.dose, style: AppTheme().subTitleBlack),
          ),
        ));
  }

  Widget _setHeaderValue() {
    return Container(
        padding: const EdgeInsets.only(
            left: Dimensions.pX20,
            right: Dimensions.pX10,
            top: Dimensions.pX16,
            bottom: Dimensions.pX10),
        color: AppColors().primary,
        child: Text(
            'Amount of medicines taken in the week of the 7th of January (${widget.list.length}).',
            style: AppTheme().appSubTitle));
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
