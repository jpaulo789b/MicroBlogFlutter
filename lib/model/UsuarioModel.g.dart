// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsuarioModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) {
  return UsuarioModel(
    ref: json['ref'] as String,
    name: json['name'] as String,
    profilePicture: json['profilePicture'] as String,
    password: json['password'] as String,
    email: json['email'] as String,
    lastSign: json['lastSign'] == null
        ? null
        : DateTime.parse(json['lastSign'] as String),
  );
}

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'password': instance.password,
      'email': instance.email,
      'lastSign': instance.lastSign?.toIso8601String(),
    };
