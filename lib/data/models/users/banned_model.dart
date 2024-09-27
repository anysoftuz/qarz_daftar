// To parse this JSON data, do
//
//     final bannedModel = bannedModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'banned_model.g.dart';

List<BannedModel> bannedModelFromJson(String str) => List<BannedModel>.from(
    json.decode(str).map((x) => BannedModel.fromJson(x)));

String bannedModelToJson(List<BannedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class BannedModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "score")
  final int score;
  @JsonKey(name: "full_name")
  final String fullName;

  const BannedModel({
    this.id = 0,
    this.avatar = "",
    this.score = 0,
    this.fullName = "",
  });

  factory BannedModel.fromJson(Map<String, dynamic> json) =>
      _$BannedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannedModelToJson(this);
}
