import 'package:json_annotation/json_annotation.dart';
import 'medicine_model.dart';
part 'moment_model.g.dart';

@JsonSerializable()
class Momenta {
  String date;
  String title;
  int icon;
  List<Medicines> medicines;

  Momenta(this.date, this.title, this.icon, this.medicines);

  // factory Momenta.fromJson(Map<String, dynamic> json) => _$MomentaFromJson(json);
  // Map<String, dynamic> toJson() => _$MomentaToJson(this);

  factory Momenta.fromJson(Map<String, dynamic> json) =>
      _$MomentaFromJson(json);
  Map<String, dynamic> toJson() => _$MomentaToJson(this);

  @override
  // TODO: implement iterator
  Iterator get iterator => throw UnimplementedError();
}

/*{
"date": "2019-01-05",
"title": "Break First",
"icon": 1,
"medicines": [
{
"name": "Simvastatine",
"dose": "2 stuck, 40 mg"
},
{
"name": "Simvastatine",
"dose": "2 stuck, 40 mg"
}
]
}*/
