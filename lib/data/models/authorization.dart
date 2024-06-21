import 'package:json_annotation/json_annotation.dart';

part 'authorization.g.dart';

@JsonSerializable()
class Authorization{

  String? token;
  String? type;

  Authorization({this.token, this.type});

  factory Authorization.fromJson(Map<String, dynamic> json) => _$AuthorizationFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);


}