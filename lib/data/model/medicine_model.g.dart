// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicines _$MedicinesFromJson(Map<String, dynamic> json) => Medicines(
      json['name'] as String,
      json['dose'] as String,
      json['isTaken'] as bool,
    );

Map<String, dynamic> _$MedicinesToJson(Medicines instance) => <String, dynamic>{
      'name': instance.name,
      'dose': instance.dose,
      'isTaken': instance.isTaken,
    };
