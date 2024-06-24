// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String?,
      contentType: json['content_type'] as String?,
      senderId: (json['sender_id'] as num?)?.toInt(),
      conversationId: (json['conversation_id'] as num?)?.toInt(),
      isRead: json['is_read'] as bool? ?? false,
      isReceived: json['is_received'] as bool? ?? false,
      isSent: json['is_sent'] as bool? ?? false,
      sender: json['sender'] == null
          ? null
          : User.fromJson(json['sender'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'content_type': instance.contentType,
      'sender_id': instance.senderId,
      'conversation_id': instance.conversationId,
      'is_read': instance.isRead,
      'is_received': instance.isReceived,
      'is_sent': instance.isSent,
      'sender': instance.sender,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
