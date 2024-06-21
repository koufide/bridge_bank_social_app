// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorisation _$AuthorisationFromJson(Map<String, dynamic> json) =>
    Authorisation(
      token: json['token'] as String?,
      bearer: json['type'] as String?,
    );

Map<String, dynamic> _$AuthorisationToJson(Authorisation instance) =>
    <String, dynamic>{
      'token': instance.token,
      'type': instance.bearer,
    };
