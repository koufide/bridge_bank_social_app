import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable()
class Sender{
  int? id;
  @JsonKey(name: "first_name")
  String firstName;
  @JsonKey(name: "last_name")
  String LastName;
  String email;
  String password;
  String? photo;
  @JsonKey(name: "created_at")
  DateTime createdAt;
   @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  DateTime deletedAt;

  Sender({
    this.id,
    this.firstName,
    this.LastName,
    this.email,
    this.password,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

    factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
  Map<String, dynamic> toJson() => _$SenderToJson(this);

}


