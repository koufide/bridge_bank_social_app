import 'package:json_annotation/json_annotation.dart';

part 'authorisation.g.dart';

@JsonSerializable()
class Authorisation {
  String? token;
  @JsonKey(name: "type")
  String? bearer;

  Authorisation({this.token, this.bearer});

  // Authorisation.fromJson(Map<String, dynamic> json) {
  //   token = json['token'];
  //   bearer = json['type'];
  // }

  // Map<String, dynamic> toJson(){
  //   return {
  //     "token":token,
  //     "bearer":bearer,
  //   };
  // }

  factory Authorisation.fromJson(Map<String, dynamic> json) => _$AuthorisationFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorisationToJson(this);


}
