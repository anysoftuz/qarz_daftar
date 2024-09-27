// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostOperationModel _$PostOperationModelFromJson(Map<String, dynamic> json) =>
    PostOperationModel(
      contractorId: (json['contractor_id'] as num).toInt(),
      contractorType: json['contractor_type'] as String,
      amount: (json['amount'] as num).toInt(),
      deadline: json['deadline'] as String,
      isBlacklist: json['is_blacklist'] as bool,
      description: json['description'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PostOperationModelToJson(PostOperationModel instance) =>
    <String, dynamic>{
      'contractor_id': instance.contractorId,
      'contractor_type': instance.contractorType,
      'amount': instance.amount,
      'deadline': instance.deadline,
      'is_blacklist': instance.isBlacklist,
      'description': instance.description,
      'currency': instance.currency,
    };
