import 'package:bridgebank_social_app/data/models/message.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation{

  int? id;
  @JsonKey(name: "speakers", defaultValue: [])
  List<int> speakers;
  @JsonKey(name: "is_group", defaultValue: false)
  bool isGroup;
  @JsonKey(name: "group_name")
  String? groupName;
  @JsonKey(name: "admins", defaultValue: [])
  List<int> admins;
  @JsonKey(name: "speaker_list", defaultValue: [])
  List<int> speakerList;
  @JsonKey(name: "users", defaultValue: [])
  List<User> users;
  @JsonKey(name: "messages", defaultValue: [])
  List<Message> messages;

  @JsonKey(name: "created_at")
  DateTime? createdAt; //created_at
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Conversation({
    this.id,
    required this.speakers,
    this.isGroup = false,
    this.groupName,
    required this.admins,
    required this.speakerList,
    required this.users,
    required this.messages,
    this.createdAt,
    this.updatedAt});

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}