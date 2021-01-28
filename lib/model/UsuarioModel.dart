import 'package:json_annotation/json_annotation.dart';
part 'UsuarioModel.g.dart';

@JsonSerializable()
class UsuarioModel {

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => _$UsuarioModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);
  static  Map<String, dynamic> toJsonMain(UsuarioModel model) => _$UsuarioModelToJson(model);
  UsuarioModel clone() => _$UsuarioModelFromJson(this.toJson());

  String ref;
  String name;
  String profilePicture;
  String password;
  String email;
  DateTime lastSign;

  UsuarioModel({this.ref,this.name, this.profilePicture, this.password, this.email, this.lastSign});
  

}