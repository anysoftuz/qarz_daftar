// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphic_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphicStatisticsModel _$GraphicStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    GraphicStatisticsModel(
      date: json['date'] as String? ?? "",
      statistics: (json['statistics'] as List<dynamic>?)
              ?.map((e) => Statistic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GraphicStatisticsModelToJson(
        GraphicStatisticsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'statistics': instance.statistics,
    };

Statistic _$StatisticFromJson(Map<String, dynamic> json) => Statistic(
      type: json['type'] as String? ?? "",
      amount: (json['amount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };
