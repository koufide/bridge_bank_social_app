import 'package:bridgebank_social_app/data/models/sender.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

enum MessageContentType {
  text, audio, video
}

@JsonSerializable()
class Message {
  User? sender;
  String? content;
  @JsonKey(name: "content_type")
  String? contentType;
  @JsonKey(name: "sender_id")
  int? senderId;
  @JsonKey(name: "conversation_id")
  int? conversationId;
  @JsonKey(name: "is_read")
  bool isRead;
  @JsonKey(name: "is_received")
  bool isReceived;
  @JsonKey(name: "is_group")
  // bool isGroup;
  @JsonKey(name: "is_sent")
  bool isSent;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  int? id;

  Message({
    this.sender,
    this.content,
    this.contentType,
    this.senderId,
    this.conversationId,
    required this.isRead,
    required this.isReceived,
    required this.isSent,
    // this.isGroup,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);



}
