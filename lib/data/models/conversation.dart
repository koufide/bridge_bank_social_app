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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Conversation &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  //TODO isConnected()
  bool isConnected(){
    return true;
  }

  String senderName(User me){
    if(isGroup){
      return groupName??"Inconnu";
    }

    if(users.isEmpty){
      return "Inconnu";
    }

    final List<User> list = users.where((sender)=> sender != me).toList();
    if(list.isNotEmpty){
      return '${list.first.firstName} ${list.first.lastName}';
    }

    return "Inconnu";
  }

  String messageContent(){

    if(messages.isEmpty){
      return "";
    }

    List<Message> list = messages.where((message)=> message.isRead != true).toList();
    list.sort((a,b)=>b.createdAt!.compareTo(a.createdAt!));

    if(list.isNotEmpty){
      if(list.first.contentType == MessageContentType.text.name){
        return list.first.content??"";
      }
    }

    return "";
  }

  DateTime? lastMessageDate(){

    if(messages.isEmpty){
      return null;
    }

    List<Message> list = messages.where((message)=> message.isRead != true).toList();
    list.sort((a,b)=>b.createdAt!.compareTo(a.createdAt!));

    if(list.isNotEmpty){
      return list.first.createdAt;
    }

    return null;
  }

  int unReadCount(){

    if(messages.isEmpty){
      return 0;
    }

    List<Message> list = messages.where((message)=> message.isRead != true).toList();
    list.sort((a,b)=>b.createdAt!.compareTo(a.createdAt!));

    if(list.isNotEmpty){
      return list.length;
    }

    return 0;
  }
}