// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramModel _$TelegramModelFromJson(Map<String, dynamic> json) =>
    TelegramModel(
      success: json['success'] as bool? ?? false,
      user: json['user'] == null
          ? const TelegramModelUser()
          : TelegramModelUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TelegramModelToJson(TelegramModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
    };

TelegramModelUser _$TelegramModelUserFromJson(Map<String, dynamic> json) =>
    TelegramModelUser(
      user: json['user'] == null
          ? const UserUser()
          : UserUser.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String? ?? "",
      refreshToken: json['refresh_token'] as String? ?? "",
    );

Map<String, dynamic> _$TelegramModelUserToJson(TelegramModelUser instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

UserUser _$UserUserFromJson(Map<String, dynamic> json) => UserUser(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['full_name'] as String? ?? "",
      role: json['role'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      phone: json['phone'] ?? "",
      avatar: json['avatar'] as String? ?? "",
    );

Map<String, dynamic> _$UserUserToJson(UserUser instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'role': instance.role,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
