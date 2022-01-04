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

  factory Momenta.fromJson(Map<String, dynamic> json) =>
      _$MomentaFromJson(json);
  Map<String, dynamic> toJson() => _$MomentaToJson(this);
  Iterator get iterator => throw UnimplementedError();
}
