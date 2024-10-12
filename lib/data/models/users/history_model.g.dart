// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      amount: json['amount'] as String? ?? "",
      debt: json['debt'] as String? ?? "",
      deadline: json['deadline'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
      concat: json['concat'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      status: json['status'] as String? ?? "",
      contractorType: json['contractor_type'] as String? ?? "",
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'debt': instance.debt,
      'deadline': instance.deadline,
      'currency': instance.currency,
      'status': instance.status,
      'concat': instance.concat,
      'avatar': instance.avatar,
      'contractor_type': instance.contractorType,
    };
