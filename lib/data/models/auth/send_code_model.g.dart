// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeModel _$SendCodeModelFromJson(Map<String, dynamic> json) =>
    SendCodeModel(
      phone: json['phone'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SendCodeModelToJson(SendCodeModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'full_name': instance.fullName,
    };
