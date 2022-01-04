// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Momenta _$MomentaFromJson(Map<String, dynamic> json) => Momenta(
      json['date'] as String,
      json['title'] as String,
      json['icon'] as int,
      (json['medicines'] as List<dynamic>)
          .map((e) => Medicines.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MomentaToJson(Momenta instance) => <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'icon': instance.icon,
      'medicines': instance.medicines,
    };
