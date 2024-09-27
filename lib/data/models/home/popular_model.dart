// To parse this JSON data, do
//
//     final popularModel = popularModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'popular_model.g.dart';

PopularModel popularModelFromJson(String str) =>
    PopularModel.fromJson(json.decode(str));

String popularModelToJson(PopularModel data) => json.encode(data.toJson());

@JsonSerializable()
class PopularModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "score")
  final int score;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "full_name")
  final String fullName;

  const PopularModel({
    this.id = 0,
    this.score = 0,
    this.avatar = "",
    this.fullName = "",
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) =>
      _$PopularModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularModelToJson(this);
}
