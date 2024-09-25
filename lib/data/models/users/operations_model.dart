// To parse this JSON data, do
//
//     final operationsModel = operationsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'operations_model.g.dart';

OperationModel operationModelFromJson(String str) =>
    OperationModel.fromJson(json.decode(str));

String operationModelToJson(OperationModel data) => json.encode(data.toJson());

@JsonSerializable()
class OperationModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "debt")
  final int debt;
  @JsonKey(name: "deadline")
  final String deadline;
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "contractor_full_name")
  final String contractorFullName;
  @JsonKey(name: "contractor_avatar")
  final String contractorAvatar;
  @JsonKey(name: "contractor_type")
  final String contractorType;

  OperationModel({
    this.id = 0,
    this.amount = 0,
    this.debt = 0,
    this.deadline = "",
    this.currency = "",
    this.status = "",
    this.contractorFullName = "",
    this.contractorAvatar = "",
    this.contractorType = "",
  });

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OperationModelToJson(this);
}
