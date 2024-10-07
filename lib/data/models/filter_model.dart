// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'filter_model.g.dart';

FilterModel filterModelFromJson(String str) =>
    FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

@JsonSerializable()
class FilterModel {
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "search")
  final String? search;
  @JsonKey(name: "full_name")
  final String? fullName;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "sum")
  final int? sum;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "offset")
  final int? offset;
  @JsonKey(name: "cursor")
  final int? cursor;
  @JsonKey(name: "take")
  final int? take;

  FilterModel({
    this.userId,
    this.phone,
    this.fullName,
    this.date,
    this.sum,
    this.currency,
    this.limit,
    this.offset,
    this.cursor,
    this.search,
    this.take,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
