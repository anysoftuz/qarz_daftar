// To parse this JSON data, do
//
//     final sendCodeModel = sendCodeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'send_code_model.g.dart';

SendCodeModel sendCodeModelFromJson(String str) =>
    SendCodeModel.fromJson(json.decode(str));

String sendCodeModelToJson(SendCodeModel data) => json.encode(data.toJson());

@JsonSerializable()
class SendCodeModel {
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "id")
  final int id;

  const SendCodeModel({
    this.phone = "",
    this.id = 0,
  });

  SendCodeModel copyWith({
    String? phone,
    int? id,
  }) =>
      SendCodeModel(
        phone: phone ?? this.phone,
        id: id ?? this.id,
      );

  factory SendCodeModel.fromJson(Map<String, dynamic> json) =>
      _$SendCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeModelToJson(this);
}
