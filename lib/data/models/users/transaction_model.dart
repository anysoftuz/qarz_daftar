// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transaction_model.g.dart';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "note")
  final String note;

  TransactionModel({
    required this.amount,
    required this.type,
    required this.note,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
