// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PublicacaoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicacaoModel _$PublicacaoModelFromJson(Map<String, dynamic> json) {
  return PublicacaoModel(
    refUser: json['refUser'] as String,
    datePost: json['datePost'] == null
        ? null
        : DateTime.parse(json['datePost'] as String),
    postBody: json['postBody'] as String,
  );
}

Map<String, dynamic> _$PublicacaoModelToJson(PublicacaoModel instance) =>
    <String, dynamic>{
      'refUser': instance.refUser,
      'datePost': instance.datePost?.toIso8601String(),
      'postBody': instance.postBody,
    };
