import 'package:bridgebank_social_app/data/models/message.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
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
  @JsonKey(name: "speaker_list", defaultValue: [])
  List<int>? speakerList;
  @JsonKey(name: "users", defaultValue: [])
  List<User> users;
  @JsonKey(name: "messages", defaultValue: [])
  List<Message> messages;

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
      required this.speakers,
      required this.isGroup,
      this.groupName,
      this.admins,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      required this.speakerList,
      required this.users,
      required this.messages});

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Conversation &&
          runtimeType == other.runtimeType &&
          users == other.users;

  @override
  int get hashCode => users.hashCode;

  String senderName(User me){
    if(isGroup){
      return groupName??"Inconnu";
    }

    if(users.isEmpty){
      return "Inconnu";
    }

    final List<User> list =  users.where( (sender)=> sender != me ).toList();
    if(list.isNotEmpty){
      return '${list.first.firstName}  ${list.first.lastName}';
    }

    return "Inconnu";

  }

  String? messageContent(){
    if(messages.isEmpty){
      return "";
    }

    List<Message> list = messages.where( (message)=>message.isRead != true ).toList();
    list.sort( (a,b)=>b.createdAt!.compareTo(a.createdAt!) );

    if(list.isNotEmpty){
      if(list.first.contentType == MessageContentType.text.name){
        return list.first.content??"";
      }
    }
  }

  DateTime? lastMessage(){
    if(messages.isEmpty){
      return null;
    }

    List<Message> list = messages.where( (message)=>message.isRead != true ).toList();
    list.sort( (a,b)=>b.createdAt!.compareTo(a.createdAt!) );

    if(list.isNotEmpty){
      // if(list.first.contentType == MessageContentType.text.name){
        return list.first.createdAt;
      // }
    }

    return null;
  }


  int unReadCount(){
    if(messages.isEmpty){
      return 0;
    }

    List<Message> list = messages.where( (message)=>message.isRead != true ).toList();
    list.sort( (a,b)=>b.createdAt!.compareTo(a.createdAt!) );

    if(list.isNotEmpty){
      // if(list.first.contentType == MessageContentType.text.name){
      return list.length;
      // }
    }

    return 0;
  }


}
