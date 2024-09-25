// To parse this JSON data, do
//
//     final contactsModel = contactsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'contacts_model.g.dart';

ContactsModel contactsModelFromJson(String str) =>
    ContactsModel.fromJson(json.decode(str));

String contactsModelToJson(ContactsModel data) => json.encode(data.toJson());

@JsonSerializable()
class ContactsModel {
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "startCursor")
  final int startCursor;
  @JsonKey(name: "endCursor")
  final int endCursor;
  @JsonKey(name: "totalCount")
  final int totalCount;

  const ContactsModel({
    this.data = const [],
    this.startCursor = 0,
    this.endCursor = 0,
    this.totalCount = 0,
  });

  factory ContactsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "original_first_name")
  final String originalFirstName;
  @JsonKey(name: "original_last_name")
  final String originalLastName;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "score")
  final int score;
  @JsonKey(name: "banned_count")
  final int bannedCount;
  @JsonKey(name: "is_blacklist")
  final bool isBlacklist;

  const Datum({
    this.id = 0,
    this.fullName = "",
    this.originalFirstName = "",
    this.originalLastName = "",
    this.phone = "",
    this.avatar = "",
    this.score = 0,
    this.bannedCount = 0,
    this.isBlacklist = false,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
