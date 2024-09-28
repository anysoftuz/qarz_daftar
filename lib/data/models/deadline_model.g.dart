// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deadline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeadlineModel _$DeadlineModelFromJson(Map<String, dynamic> json) =>
    DeadlineModel(
      deadline: json['deadline'] as String,
      isBlacklist: json['is_blacklist'] as bool,
    );

Map<String, dynamic> _$DeadlineModelToJson(DeadlineModel instance) =>
    <String, dynamic>{
      'deadline': instance.deadline,
      'is_blacklist': instance.isBlacklist,
    };
