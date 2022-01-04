import 'package:test_f_one/data/model/medicine_model.dart';
import 'package:test_f_one/controllers/time_tracker.dart';
import 'package:test_f_one/data/model/moment_model.dart';
import 'package:test_f_one/helpers/constants.dart';
import 'package:flutter/material.dart';

class TimeTrackerWidget extends StatefulWidget {
  final MomentArguments item;

  const TimeTrackerWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _TimeTrackerWidgetState createState() => _TimeTrackerWidgetState();
}

class _TimeTrackerWidgetState extends State<TimeTrackerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().primary,
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.pX10, right: Dimensions.pX10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: _isMedicineTaken(widget.item.momenta.medicines)
                  ? AppColors().accent
                  : AppColors().unSelect,
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                    left: Dimensions.pX4, right: Dimensions.pX14),
                onTap: () {
                  setState(() {
                    bool isValid = false;
                    (widget.item.isExpand) ? isValid = false : isValid = true;
                    widget.item.isExpand = isValid;
                  });
                },
                title: _setCellTitleContent(),
                subtitle: _setCellSubTitleContent(),
                trailing: _setCellTrailingImageContent(),
                leading: _setCellLeadingImageContent(),
              ),
            ),
            (widget.item.isExpand)
                ? Column(children: _buildExpandableContent(widget.item.momenta))
                : Column(
                    children: const <Widget>[],
                  )
          ],
        ),
      ),
    );
  }

  _buildExpandableContent(Momenta medicines) {
    List<Widget> columnContent = [];
    for (Medicines content in medicines.medicines) {
      columnContent.add(_setExpandableContent(content));
    }
    return columnContent;
  }

  Widget _setCellTitleContent() {
    return Text(
      '${widget.item.momenta.title} (${widget.item.momenta.medicines.length} medicine)',
      style: _isMedicineTaken(widget.item.momenta.medicines)
          ? AppTheme().titleWhite
          : AppTheme().titleBlack,
    );
  }

  bool _isMedicineTaken(List<Medicines> medicines) {
    bool isTaken = false;
    for (Medicines medicine in medicines) {
      (medicine.isTaken) ? isTaken = true : isTaken = false;
    }
    return isTaken;
  }

  Widget _setCellSubTitleContent() {
    return Text(
      widget.item.momenta.title,
      style: _isMedicineTaken(widget.item.momenta.medicines)
          ? AppTheme().subTitleWhite
          : AppTheme().subTitleBlack,
    );
  }

  Widget _setCellTrailingImageContent() {
    return _isMedicineTaken(widget.item.momenta.medicines)
        ? Image.asset(CheckBoxTypes.displayText(2),
            height: Dimensions.pX20, width: Dimensions.pX20, fit: BoxFit.fill)
        : Image.asset(CheckBoxTypes.displayText(1),
            height: Dimensions.pX20, width: Dimensions.pX20, fit: BoxFit.fill);
  }

  Widget _setCellLeadingImageContent() {
    return Container(
      padding: const EdgeInsets.only(
          left: Dimensions.pX10,
          top: Dimensions.pX10,
          right: 0,
          bottom: Dimensions.pX10),
      child: Image.asset(IconTypes.displayText(widget.item.momenta.icon),
          fit: BoxFit.fill),
    );
  }
}

Widget _setExpandableContent(Medicines medicines) {
  return Card(
    child: ListTile(
        title: Text(
          medicines.name,
          style: AppTheme().titleBlack,
        ),
        subtitle: Text(
          medicines.dose,
          style: AppTheme().subTitleBlack,
        ),
        trailing: medicines.isTaken
            ? Image.asset(CheckBoxTypes.displayText(3),
                height: Dimensions.pX20,
                width: Dimensions.pX20,
                fit: BoxFit.fill)
            : Image.asset(CheckBoxTypes.displayText(1),
                height: Dimensions.pX20,
                width: Dimensions.pX20,
                fit: BoxFit.fill)),
  );
}
