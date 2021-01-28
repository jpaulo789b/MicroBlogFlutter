import 'package:json_annotation/json_annotation.dart';
part 'PublicacaoModel.g.dart';
@JsonSerializable()
class PublicacaoModel {
  factory PublicacaoModel.fromJson(Map<String, dynamic> json) => _$PublicacaoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PublicacaoModelToJson(this);
  PublicacaoModel clone() => _$PublicacaoModelFromJson(this.toJson());

  final String refUser;
  final DateTime datePost;
  final String postBody;

  PublicacaoModel({this.refUser, this.datePost, this.postBody});


  
}