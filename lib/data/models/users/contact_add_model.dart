// To parse this JSON data, do
//
//     final contactAddModel = contactAddModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'contact_add_model.g.dart';

ContactAddModel contactAddModelFromJson(String str) =>
    ContactAddModel.fromJson(json.decode(str));

String contactAddModelToJson(ContactAddModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ContactAddModel {
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "phone")
  final String phone;

  ContactAddModel({
    required this.fullName,
    required this.phone,
  });

  factory ContactAddModel.fromJson(Map<String, dynamic> json) =>
      _$ContactAddModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactAddModelToJson(this);
}
