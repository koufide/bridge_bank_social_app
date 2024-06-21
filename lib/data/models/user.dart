import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String?lastName;
  String? email;
  String? photo;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
//DateTime? deletedAt;

  User({this.id, this.firstName, this.lastName, this.email, this.photo,
      this.createdAt, this.updatedAt});

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, photo: $photo, createdAt: $createdAt, updatedAt: $updatedAt}';
  }



  // User.fromJson(Map<String, dynamic> json){
  //   id = json['id'];
  //   firstName = json['first_name'];
  //   lastName = json['last_name'];
  //   email = json['email'];
  //   photo = json['photo'];
  //
  //   if(json['created_at'] != null){
  //     createdAt = DateTime.parse(json['created_at']);
  //   }
  //
  //   if(json['updated_at'] != null){
  //     updatedAt = DateTime.parse(json['updated_at']);
  //   }
  //
  //
  // } // User.fromJson


// Map<String, dynamic> toJson(){
//     return {
//       "id":id,
//       "lastName":lastName,
//       "firstName":firstName,
//       "photo":photo,
//       "email":email,
//       "createdAt":createdAt,
//       "updatedAt":updatedAt
//     };
// }



  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

   
}