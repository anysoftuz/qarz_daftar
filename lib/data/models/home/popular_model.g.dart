// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularModel _$PopularModelFromJson(Map<String, dynamic> json) => PopularModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      score: (json['score'] as num?)?.toInt() ?? 0,
      avatar: json['avatar'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
    );

Map<String, dynamic> _$PopularModelToJson(PopularModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'avatar': instance.avatar,
      'full_name': instance.fullName,
    };
