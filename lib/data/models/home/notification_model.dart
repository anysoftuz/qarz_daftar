// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'notification_model.g.dart';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "item_type")
  final String itemType;
  @JsonKey(name: "item_id")
  final int itemId;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "sender_full_name")
  final String senderFullName;
  @JsonKey(name: "confirm_status")
  final String confirmStatus;

  const NotificationModel({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.status = "",
    this.avatar = "",
    this.itemType = "",
    this.itemId = 0,
    this.createdAt = "",
    this.senderFullName = "",
    this.confirmStatus = "",
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
