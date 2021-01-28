// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NovidadeBoticario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NovidadeBoticario _$NovidadeBoticarioFromJson(Map<String, dynamic> json) {
  return NovidadeBoticario(
    user: json['user'] == null
        ? null
        : UsuarioModel.fromJson(json['user'] as Map<String, dynamic>),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    ref: json['ref'] as num,
  );
}

Map<String, dynamic> _$NovidadeBoticarioToJson(NovidadeBoticario instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'user': UsuarioModel.toJsonMain(instance.user),
      'message': Message.toJsonMain(instance.message),
    };

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    content: json['content'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'content': instance.content,
      'created_at': instance.createdAt?.toIso8601String(),
    };
