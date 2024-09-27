// To parse this JSON data, do
//
//     final postOperationModel = postOperationModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_operation_model.g.dart';

PostOperationModel postOperationModelFromJson(String str) =>
    PostOperationModel.fromJson(json.decode(str));

String postOperationModelToJson(PostOperationModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PostOperationModel {
  @JsonKey(name: "contractor_id")
  final int contractorId;
  @JsonKey(name: "contractor_type")
  final String contractorType;
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "deadline")
  final String deadline;
  @JsonKey(name: "is_blacklist")
  final bool isBlacklist;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "currency")
  final String currency;

  PostOperationModel({
    required this.contractorId,
    required this.contractorType,
    required this.amount,
    required this.deadline,
    required this.isBlacklist,
    required this.description,
    required this.currency,
  });

  factory PostOperationModel.fromJson(Map<String, dynamic> json) =>
      _$PostOperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostOperationModelToJson(this);
}
