// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      userId: json['user_id'] as String?,
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      date: json['date'] as String?,
      sum: (json['sum'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      cursor: (json['cursor'] as num?)?.toInt(),
      search: json['search'] as String?,
      take: (json['take'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'phone': instance.phone,
      'search': instance.search,
      'full_name': instance.fullName,
      'date': instance.date,
      'sum': instance.sum,
      'currency': instance.currency,
      'limit': instance.limit,
      'offset': instance.offset,
      'cursor': instance.cursor,
      'take': instance.take,
    };
