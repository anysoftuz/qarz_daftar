// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banned_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannedModel _$BannedModelFromJson(Map<String, dynamic> json) => BannedModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      avatar: json['avatar'] as String? ?? "",
      score: (json['score'] as num?)?.toInt() ?? 0,
      fullName: json['full_name'] as String? ?? "",
    );

Map<String, dynamic> _$BannedModelToJson(BannedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'score': instance.score,
      'full_name': instance.fullName,
    };
