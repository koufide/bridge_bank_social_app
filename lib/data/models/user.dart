import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{

  int? id;
  @JsonKey(name: "first_name")
  String? firstName;//first_name
  @JsonKey(name: "last_name")
  String? lastName;//last_name
  String? email;
  String? photo;
  @JsonKey(name: "created_at")
  DateTime? createdAt; //created_at
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;//updated_at

  User({this.id, this.firstName, this.lastName, this.email, this.photo,
    this.createdAt, this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, photo: $photo, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}