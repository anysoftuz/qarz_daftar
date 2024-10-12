// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'history_model.g.dart';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(
    json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class HistoryModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "amount")
  final String amount;
  @JsonKey(name: "debt")
  final String debt;
  @JsonKey(name: "deadline")
  final String deadline;
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "concat")
  final String concat;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "contractor_type")
  final String contractorType;

  const HistoryModel({
    this.id = 0,
    this.amount = "",
    this.debt = "",
    this.deadline = "",
    this.currency = "",
    this.concat = "",
    this.avatar = "",
    this.status = "",
    this.contractorType = "",
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}
