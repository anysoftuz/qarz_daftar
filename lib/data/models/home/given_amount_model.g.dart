// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'given_amount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GivenAmountModel _$GivenAmountModelFromJson(Map<String, dynamic> json) =>
    GivenAmountModel(
      currency: json['currency'] as String? ?? "",
      amount: json['amount'] as String? ?? "",
    );

Map<String, dynamic> _$GivenAmountModelToJson(GivenAmountModel instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'amount': instance.amount,
    };
