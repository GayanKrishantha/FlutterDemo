import 'package:test_f_one/data/model/medicine_model.dart';
import 'package:test_f_one/controllers/time_tracker.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

class Utils {
  static String dateFormatterWithString(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    String formattedDate = DateFormat('EEEE DD MMM').format(tempDate);
    return formattedDate;
  }

  static DateTime dateFormatterWithDate(String date) {
    DateTime tempDate =
        DateFormat(AppDateFormat().apiDateFormatter).parse(date);
    return tempDate;
  }

  static List<Medicines> filterByDateRange(List<MomentArguments> list) {
    List<Medicines> medicineList = [];
    DateTime suggestedStartDate = DateFormat(AppDateFormat().apiDateFormatter)
        .parse('2021-01-07 19:00:00');
    DateTime suggestedEndDate = DateFormat(AppDateFormat().apiDateFormatter)
        .parse('2021-01-14 19:00:00');

    for (MomentArguments arg in list) {
      if (suggestedStartDate
              .isBefore(Utils.dateFormatterWithDate(arg.momenta.date)) &&
          suggestedEndDate
              .isAfter(Utils.dateFormatterWithDate(arg.momenta.date))) {
        medicineList.addAll(arg.momenta.medicines);
      }
    }
    return medicineList;
  }
}
