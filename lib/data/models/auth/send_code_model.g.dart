// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeModel _$SendCodeModelFromJson(Map<String, dynamic> json) =>
    SendCodeModel(
      phone: json['phone'] as String? ?? "",
      id: (json['telegram_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SendCodeModelToJson(SendCodeModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'telegram_id': instance.id,
    };
