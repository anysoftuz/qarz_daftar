// To parse this JSON data, do
//
//     final graphicStatisticsModel = graphicStatisticsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'graphic_statistics_model.g.dart';

List<GraphicStatisticsModel> graphicStatisticsModelFromJson(String str) =>
    List<GraphicStatisticsModel>.from(
        json.decode(str).map((x) => GraphicStatisticsModel.fromJson(x)));

String graphicStatisticsModelToJson(List<GraphicStatisticsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class GraphicStatisticsModel {
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "statistics")
  final List<Statistic> statistics;

  const GraphicStatisticsModel({
    this.date = "",
    this.statistics = const [],
  });

  factory GraphicStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$GraphicStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GraphicStatisticsModelToJson(this);
}

@JsonSerializable()
class Statistic {
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "amount")
  final int amount;

  const Statistic({
    this.type = "",
    this.amount = 0,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticToJson(this);
}
