// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      success: json['success'] as bool,
      user: UserModelUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
    };

UserModelUser _$UserModelUserFromJson(Map<String, dynamic> json) =>
    UserModelUser(
      user: UserGetModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$UserModelUserToJson(UserModelUser instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
