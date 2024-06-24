import 'package:bridgebank_social_app/data/models/message.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  int? id;
  @JsonKey(name: "speakers", defaultValue: [])
  List<int> speakers;
  @JsonKey(name: "is_group")
  bool isGroup;
  @JsonKey(name: "group_name")
  String? groupName;
  String? admins;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "deleted_at")
  DateTime? deletedAt;
  @JsonKey(name: "speak")
  @JsonKey(name: "speakerList", defaultValue: [])
  List<int>? speaker_list;
  @JsonKey(name: "users", defaultValue: [])
  List<User>? users;
  @JsonKey(name: "messages", defaultValue: [])
  List<Message>? messages;

  // String? senderName;
  // String? messageContent;
  // DateTime? lastMessageDate;
  // int unReadCount;
  // bool isConnected;

  Conversation(
      {
      // this.senderName,
      // this.messageContent,
      // this.lastMessageDate,
      // this.unReadCount = 0,
      // this.isConnected = false
      this.id,
      this.speakers,
      this.isGroup,
      this.groupName,
      this.admins,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.speaker_list,
      this.users,
      this.messages});

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
