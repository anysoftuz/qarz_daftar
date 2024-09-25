// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsModel _$ContactsModelFromJson(Map<String, dynamic> json) =>
    ContactsModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      startCursor: (json['startCursor'] as num?)?.toInt() ?? 0,
      endCursor: (json['endCursor'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ContactsModelToJson(ContactsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'startCursor': instance.startCursor,
      'endCursor': instance.endCursor,
      'totalCount': instance.totalCount,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['full_name'] as String? ?? "",
      originalFirstName: json['original_first_name'] as String? ?? "",
      originalLastName: json['original_last_name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      score: (json['score'] as num?)?.toInt() ?? 0,
      bannedCount: (json['banned_count'] as num?)?.toInt() ?? 0,
      isBlacklist: json['is_blacklist'] as bool? ?? false,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'original_first_name': instance.originalFirstName,
      'original_last_name': instance.originalLastName,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'score': instance.score,
      'banned_count': instance.bannedCount,
      'is_blacklist': instance.isBlacklist,
    };
