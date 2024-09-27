// To parse this JSON data, do
//
//     final givenAmountModel = givenAmountModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'given_amount_model.g.dart';

List<GivenAmountModel> givenAmountModelFromJson(String str) =>
    List<GivenAmountModel>.from(
        json.decode(str).map((x) => GivenAmountModel.fromJson(x)));

String givenAmountModelToJson(List<GivenAmountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class GivenAmountModel {
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "amount")
  final String amount;

  const GivenAmountModel({
    this.currency = "",
    this.amount = "",
  });

  factory GivenAmountModel.fromJson(Map<String, dynamic> json) =>
      _$GivenAmountModelFromJson(json);

  Map<String, dynamic> toJson() => _$GivenAmountModelToJson(this);
}
