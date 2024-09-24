// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGetModel _$UserGetModelFromJson(Map<String, dynamic> json) => UserGetModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      avatar: json['avatar'] ?? "",
      gender: json['gender'] ?? "",
      role: json['role'] as String? ?? "",
      status: json['status'] as String? ?? "",
      score: (json['score'] as num?)?.toInt() ?? 0,
      telegramId: json['telegram_id'] as String? ?? "",
      isBanned: json['is_banned'] as bool? ?? false,
      isTgLogin: json['is_tg_login'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? "",
      meta: json['meta'] == null
          ? const Meta()
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserGetModelToJson(UserGetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'role': instance.role,
      'status': instance.status,
      'score': instance.score,
      'telegram_id': instance.telegramId,
      'is_banned': instance.isBanned,
      'is_tg_login': instance.isTgLogin,
      'created_at': instance.createdAt,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      theme: json['theme'] as String? ?? "",
      language: json['language'] as String? ?? "",
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'theme': instance.theme,
      'language': instance.language,
    };
