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
  @JsonKey(name: "code")
  final int code;

  const SendCodeModel({
    this.phone = "",
    this.code = 0,
  });

  SendCodeModel copyWith({
    String? phone,
    int? code,
  }) =>
      SendCodeModel(
        phone: phone ?? this.phone,
        code: code ?? this.code,
      );

  factory SendCodeModel.fromJson(Map<String, dynamic> json) =>
      _$SendCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeModelToJson(this);
}
