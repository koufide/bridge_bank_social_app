import 'package:bridgebank_social_app/data/models/authorization.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session{

  User? user;
  Authorization? authorization;

  Session({this.user, this.authorization});

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  @override
  String toString() {
    return 'Session{user: $user, authorization: $authorization}';
  }
}