import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:microblog/model/UsuarioModel.dart';
import 'package:microblog/util/UtilStorage.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
part 'ControladorUsuario.g.dart';

class ControladorUsuario = _ControladorUsuarioBase with _$ControladorUsuario;

abstract class _ControladorUsuarioBase extends UtilStorage with Store {
   
  UsuarioModel mUsuario;


 


  void registrarNovoUsuario(UsuarioModel mUsuarioRegistro,{Function() sucesso, Function() carregando, Function(String erro) falha}){
    carregando?.call();
    if(mUsuarioRegistro.name?.isEmpty ?? true){
      falha?.call("O nome deve ser preenchido");
    }else if(mUsuarioRegistro.email?.isEmpty ?? true){
      falha?.call("O email deve ser preenchido");
    }else if(mUsuarioRegistro.password?.isEmpty ?? true){
      falha?.call("Uma senha deve ser preenchida");
    }else
    salvarNoBanco(DataBaseKey.USERS,objeto: mUsuario.toJson()).then((value) {
      sucesso?.call();
    }).catchError((onError){
      falha?.call(onError.message);
    });
  }

  void loginNoApp(String user,String pass,{Function() sucesso, Function() carregando, Function(String erro) falha}) {
      carregando?.call();
      if((user ?? "").isEmpty || (pass ?? "").isEmpty){
        falha?.call("Usuário ou senha incorretos");
      }else
      queryLista<UsuarioModel>(DataBaseKey.USERS).then((usuarios){
          var usuariosEncontrados = usuarios.where((u) => (u.password ?? "").contains(pass) && (u.email ?? "").contains(user)).toList();
          if(usuariosEncontrados.isNotEmpty){
            mUsuario = usuariosEncontrados.first;
            return salvarNoBanco(DataBaseKey.LOCALUSER,objeto: mUsuario.toJson());
          }else {
           return "Usuário ou senha incorretos";
          }
      }).then((value) {
          if(mUsuario == null){
              falha?.call(value.toString());
          }else {
              sucesso?.call();
          }
      }).catchError((onError){
          falha?.call(onError.message);
      });
  }

  void consultarSeHaUsuarioLogado({Function() possuiUsuario, Function() naoPossuiUsuario}) {
    var usuariosFake = [
      UsuarioModel(ref: "uJ", name: "João Paulo",email: "demo",password: "demo",profilePicture: "https://media-exp1.licdn.com/dms/image/C4D03AQHjURo6qZTYoQ/profile-displayphoto-shrink_800_800/0/1527177127599?e=1617235200&v=beta&t=fi8CBHSpeiCkVLlT0oRZzvjsfGSC8dLmyQhgZ0JjVIM"),
      UsuarioModel(ref: "uA", name: "Louise",profilePicture: "https://blog.unyleya.edu.br/wp-content/uploads/2017/12/saiba-como-a-educacao-ajuda-voce-a-ser-uma-pessoa-melhor.jpeg"),
      UsuarioModel(ref: "uB", name: "Santos",profilePicture: "https://www.psicologo.com.br/wp-content/uploads/sou-uma-pessoa-boa-ou-nao-1024x538.jpg"),
      UsuarioModel(ref: "uC", name: "Danilo",profilePicture: "https://imagens.brasil.elpais.com/resizer/R3NtMFGecCj9y5NE_ZFYV6wcyJA=/768x0/arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/6TE7TL7D4YWZFV2TFRSGNGN6JE.jpg"),
      
      ];
    var postFakes = [
        NovidadeBoticario(user: usuariosFake[Random().nextInt(usuariosFake.length)],message: Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras magna mauris, interdum ac augue ut, facilisis efficitur dui. Nam euismod.",createdAt: DateTime.now().subtract(Duration(days:Random().nextInt(5))))).toJson(),
        NovidadeBoticario(user: usuariosFake[Random().nextInt(usuariosFake.length)],message: Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras magna mauris, interdum ac augue ut, facilisis efficitur dui. Nam euismod.",createdAt: DateTime.now().subtract(Duration(days:Random().nextInt(5))))).toJson(),
        NovidadeBoticario(user: usuariosFake[Random().nextInt(usuariosFake.length)],message: Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras magna mauris, interdum ac augue ut, facilisis efficitur dui. Nam euismod.",createdAt: DateTime.now().subtract(Duration(days:Random().nextInt(5))))).toJson(),
        NovidadeBoticario(user: usuariosFake[Random().nextInt(usuariosFake.length)],message: Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras magna mauris, interdum ac augue ut, facilisis efficitur dui. Nam euismod.",createdAt: DateTime.now().subtract(Duration(days:Random().nextInt(5))))).toJson(),
        NovidadeBoticario(user: usuariosFake[Random().nextInt(usuariosFake.length)],message: Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras magna mauris, interdum ac augue ut, facilisis efficitur dui. Nam euismod.",createdAt: DateTime.now().subtract(Duration(days:Random().nextInt(5))))).toJson(),
        NovidadeBoticario(user: usuariosFake[Random().nextInt(usuariosFake.length)],message: Message(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras magna mauris, interdum ac augue ut, facilisis efficitur dui. Nam euismod.",createdAt: DateTime.now().subtract(Duration(days:Random().nextInt(5))))).toJson()
      ];
      SharedPreferences prefs ;
      SharedPreferences.getInstance().then((shared) {
        prefs = shared;
        return shared.getBool('criouFake');
      }).then((value){
        if(value != null){
          usuariosFake.clear();
          postFakes.clear();
        }else {
          prefs.setBool('criouFake', true);
        }
         salvarNoBanco(DataBaseKey.USERS,lista: usuariosFake.map((e) => e.toJson()).toList()).then((value){
            return salvarNoBanco(DataBaseKey.BLOGPOSTS,lista: postFakes);
          }).then((value) {
            return queryObjeto<UsuarioModel>(DataBaseKey.LOCALUSER);
          }).then((user) {
              mUsuario = user;
              (mUsuario == null ? naoPossuiUsuario:possuiUsuario)?.call();
          }).catchError((onError){
              naoPossuiUsuario?.call();
          });
      });
            

   
  }
}