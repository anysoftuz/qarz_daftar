// To parse this JSON data, do
//
//     final userGetModel = userGetModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_get_model.g.dart';

UserGetModel userGetModelFromJson(String str) =>
    UserGetModel.fromJson(json.decode(str));

String userGetModelToJson(UserGetModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserGetModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "avatar")
  final dynamic avatar;
  @JsonKey(name: "gender")
  final dynamic gender;
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "score")
  final int score;
  @JsonKey(name: "telegram_id")
  final String telegramId;
  @JsonKey(name: "is_banned")
  final bool isBanned;
  @JsonKey(name: "is_tg_login")
  final bool isTgLogin;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "meta")
  final Meta meta;

  const UserGetModel({
    this.id = 0,
    this.firstName = "",
    this.lastName = "",
    this.phone = "",
    this.avatar = "",
    this.gender = "",
    this.role = "",
    this.status = "",
    this.score = 0,
    this.telegramId = "",
    this.isBanned = false,
    this.isTgLogin = false,
    this.createdAt = "",
    this.meta = const Meta(),
  });

  UserGetModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    dynamic avatar,
    dynamic gender,
    String? role,
    String? status,
    int? score,
    String? telegramId,
    bool? isBanned,
    bool? isTgLogin,
    String? createdAt,
    Meta? meta,
  }) =>
      UserGetModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        status: status ?? this.status,
        score: score ?? this.score,
        telegramId: telegramId ?? this.telegramId,
        isBanned: isBanned ?? this.isBanned,
        isTgLogin: isTgLogin ?? this.isTgLogin,
        createdAt: createdAt ?? this.createdAt,
        meta: meta ?? this.meta,
      );

  factory UserGetModel.fromJson(Map<String, dynamic> json) =>
      _$UserGetModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserGetModelToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "theme")
  final String theme;
  @JsonKey(name: "language")
  final String language;

  const Meta({
    this.theme = "",
    this.language = "",
  });

  Meta copyWith({
    String? theme,
    String? language,
  }) =>
      Meta(
        theme: theme ?? this.theme,
        language: language ?? this.language,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
