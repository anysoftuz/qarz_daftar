// To parse this JSON data, do
//
//     final telegramModel = telegramModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'telegram_model.g.dart';

TelegramModel telegramModelFromJson(String str) =>
    TelegramModel.fromJson(json.decode(str));

String telegramModelToJson(TelegramModel data) => json.encode(data.toJson());

@JsonSerializable()
class TelegramModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "user")
  final TelegramModelUser user;

  const TelegramModel({
    this.success = false,
    this.user = const TelegramModelUser(),
  });

  factory TelegramModel.fromJson(Map<String, dynamic> json) =>
      _$TelegramModelFromJson(json);

  Map<String, dynamic> toJson() => _$TelegramModelToJson(this);
}

@JsonSerializable()
class TelegramModelUser {
  @JsonKey(name: "user")
  final UserUser user;
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  const TelegramModelUser({
    this.user = const UserUser(),
    this.accessToken = "",
    this.refreshToken = "",
  });

  factory TelegramModelUser.fromJson(Map<String, dynamic> json) =>
      _$TelegramModelUserFromJson(json);

  Map<String, dynamic> toJson() => _$TelegramModelUserToJson(this);
}

@JsonSerializable()
class UserUser {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "phone")
  final dynamic phone;
  @JsonKey(name: "avatar")
  final String avatar;

  const UserUser({
    this.id = 0,
    this.fullName = "",
    this.role = "",
    this.firstName = "",
    this.lastName = "",
    this.phone = "",
    this.avatar = "",
  });

  factory UserUser.fromJson(Map<String, dynamic> json) =>
      _$UserUserFromJson(json);

  Map<String, dynamic> toJson() => _$UserUserToJson(this);
}
