// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:qarz_daftar/data/models/auth/user_get_model.dart';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "user")
  final UserModelUser user;

  UserModel({
    required this.success,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserModelUser {
  @JsonKey(name: "user")
  final UserGetModel user;
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  UserModelUser({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModelUser.fromJson(Map<String, dynamic> json) =>
      _$UserModelUserFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelUserToJson(this);
}

