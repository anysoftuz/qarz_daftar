// To parse this JSON data, do
//
//     final phonsModel = phonsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'phons_model.g.dart';

List<PhonsModel> phonsModelFromJson(String str) =>
    List<PhonsModel>.from(json.decode(str).map((x) => PhonsModel.fromJson(x)));

String phonsModelToJson(List<PhonsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PhonsModel {
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "full_name")
  final String fullName;

  PhonsModel({
    required this.phone,
    required this.fullName,
  });

  factory PhonsModel.fromJson(Map<String, dynamic> json) =>
      _$PhonsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhonsModelToJson(this);
}
