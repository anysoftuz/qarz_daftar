// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String? ?? "",
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['full_name'] as String? ?? "",
      role: json['role'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      avatar: json['avatar'] ?? "",
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'role': instance.role,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
