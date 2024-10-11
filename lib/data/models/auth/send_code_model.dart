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
  @JsonKey(name: "telegram_id")
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "full_name")
  final String fullName;

  const SendCodeModel({
    this.phone = "",
    this.firstName = "",
    this.avatar = "",
    this.fullName = "",
    this.lastName = "",
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
