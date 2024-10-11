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
  @JsonKey(name: "user")
  final UserGetModel user;
  @JsonKey(name: "access_token")
  final String accessToken;

  const UserModel({
    this.user = const UserGetModel(),
    this.accessToken = "",
  });

  UserModel copyWith({
    UserGetModel? user,
    String? accessToken,
  }) =>
      UserModel(
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
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
  final String phone;
  @JsonKey(name: "avatar")
  final dynamic avatar;

  const User({
    this.id = 0,
    this.fullName = "",
    this.role = "",
    this.firstName = "",
    this.lastName = "",
    this.phone = "",
    this.avatar = "",
  });

  User copyWith({
    int? id,
    String? fullName,
    String? role,
    String? firstName,
    String? lastName,
    String? phone,
    dynamic avatar,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        role: role ?? this.role,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
