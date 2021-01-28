import 'package:microblog/model/UsuarioModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'NovidadeBoticario.g.dart';
@JsonSerializable()
class NovidadeBoticario {

    factory NovidadeBoticario.fromJson(Map<String, dynamic> json) => _$NovidadeBoticarioFromJson(json);
    Map<String, dynamic> toJson() => _$NovidadeBoticarioToJson(this);
    NovidadeBoticario clone() => _$NovidadeBoticarioFromJson(this.toJson());

    NovidadeBoticario({
        this.user,
        this.message,
        this.ref
    });
    num ref;
    @JsonKey(toJson: UsuarioModel.toJsonMain)
    UsuarioModel user;
    @JsonKey(toJson: Message.toJsonMain)
    Message message;
}
@JsonSerializable()
class Message {

    factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
    Map<String, dynamic> toJson() => _$MessageToJson(this);
    static Map<String, dynamic> toJsonMain(Message message) => _$MessageToJson(message);
    Message clone() => _$MessageFromJson(this.toJson());

    Message({
        this.content,
        this.createdAt,
    });

    String content;
    @JsonKey(name: "created_at")
    DateTime createdAt;
}


