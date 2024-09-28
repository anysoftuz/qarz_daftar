// To parse this JSON data, do
//
//     final deadlineModel = deadlineModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'deadline_model.g.dart';

DeadlineModel deadlineModelFromJson(String str) =>
    DeadlineModel.fromJson(json.decode(str));

String deadlineModelToJson(DeadlineModel data) => json.encode(data.toJson());

@JsonSerializable()
class DeadlineModel {
  @JsonKey(name: "deadline")
  final String deadline;
  @JsonKey(name: "is_blacklist")
  final bool isBlacklist;

  DeadlineModel({
    required this.deadline,
    required this.isBlacklist,
  });

  factory DeadlineModel.fromJson(Map<String, dynamic> json) =>
      _$DeadlineModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeadlineModelToJson(this);
}
