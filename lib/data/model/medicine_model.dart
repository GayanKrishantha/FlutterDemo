import 'package:json_annotation/json_annotation.dart';
part 'medicine_model.g.dart';

@JsonSerializable()
class Medicines {
  String name;
  String dose;
  bool isTaken;

  Medicines(this.name, this.dose, this.isTaken);

  factory Medicines.fromJson(Map<String, dynamic> json) =>
      _$MedicinesFromJson(json);
  Map<String, dynamic> toJson() => _$MedicinesToJson(this);

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
