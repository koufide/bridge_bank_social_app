import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:flutter_login/flutter_login.dart';
import 'authorisation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  User? user;
  @JsonKey(name: "authorization")
  Authorisation? authorisation;

  Session({this.user, this.authorisation});

  // // create from json
  // Session.fromJson(Map<String, dynamic> json) {
  //   if (json['user']!=null) {
  //     user = User.fromJson(json['user'] as Map<String, dynamic>);
  //   }
  //
  //   if (json['authorization']!=null) {
  //     authorisation =
  //         Authorisation.fromJson(json['authorization'] as Map<String, dynamic>);
  //   }
  // }
  // // create to json
  // Map<String, dynamic> toJson() {
  //   return {
  //     "user": user?.toJson(),
  //     "authorisation": authorisation?.toJson(),
  //   };
  // }

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);

}
