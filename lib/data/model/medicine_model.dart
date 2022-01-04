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
  Iterator get iterator => throw UnimplementedError();
}
