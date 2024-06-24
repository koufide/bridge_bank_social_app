import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

enum MessageContentType{
  text,
  audio,
  image
}

@JsonSerializable()
class Message{

  int? id;
  String? content;
  @JsonKey(name: "content_type")
  String? contentType;
  @JsonKey(name: "sender_id")
  int? senderId;
  @JsonKey(name: "conversation_id")
  int? conversationId;
  @JsonKey(name: "is_read", defaultValue: false)
  bool isRead;
  @JsonKey(name: "is_received", defaultValue: false)
  bool isReceived;
  @JsonKey(name: "is_sent", defaultValue: false)
  bool isSent;
  User? sender;
  @JsonKey(name: "created_at")
  DateTime? createdAt; //created_at
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Message({
    this.id,
    this.content,
    this.contentType,
    this.senderId,
    this.conversationId,
     this.isRead = false,
    this.isReceived = false,
    this.isSent= false,
    this.sender,
    this.createdAt,
    this.updatedAt}); //updated_at


  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);


}