// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationModel _$OperationModelFromJson(Map<String, dynamic> json) =>
    OperationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      debt: (json['debt'] as num?)?.toInt() ?? 0,
      deadline: json['deadline'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
      status: json['status'] as String? ?? "",
      contractorFullName: json['contractor_full_name'] as String? ?? "",
      contractorAvatar: json['contractor_avatar'] as String? ?? "",
      contractorType: json['contractor_type'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      mediasIds: json['medias_ids'],
      contractorScore: (json['contractor_score'] as num?)?.toInt() ?? 0,
      contractorId: (json['contractor_id'] as num?)?.toInt() ?? 0,
      contractorPhone: json['contractor_phone'] as String? ?? "",
    );

Map<String, dynamic> _$OperationModelToJson(OperationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'debt': instance.debt,
      'deadline': instance.deadline,
      'currency': instance.currency,
      'status': instance.status,
      'contractor_full_name': instance.contractorFullName,
      'contractor_avatar': instance.contractorAvatar,
      'contractor_type': instance.contractorType,
      'created_at': instance.createdAt,
      'medias_ids': instance.mediasIds,
      'contractor_score': instance.contractorScore,
      'contractor_id': instance.contractorId,
      'contractor_phone': instance.contractorPhone,
    };
