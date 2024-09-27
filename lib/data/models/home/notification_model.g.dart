// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      status: json['status'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      itemType: json['item_type'] as String? ?? "",
      itemId: (json['item_id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      senderFullName: json['sender_full_name'] as String? ?? "",
      confirmStatus: json['confirm_status'] as String? ?? "",
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'avatar': instance.avatar,
      'item_type': instance.itemType,
      'item_id': instance.itemId,
      'created_at': instance.createdAt,
      'sender_full_name': instance.senderFullName,
      'confirm_status': instance.confirmStatus,
    };
