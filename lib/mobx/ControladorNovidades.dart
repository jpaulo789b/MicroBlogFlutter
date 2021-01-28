import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';
import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:microblog/retrofit/ServiceProvider.dart';
import 'package:microblog/util/ServiceStatus.dart';
import 'package:microblog/util/UtilStorage.dart';
import 'package:mobx/mobx.dart';
part 'ControladorNovidades.g.dart';

class ControladorNovidades = _ControladorNovidadesBase  with _$ControladorNovidades;

abstract class _ControladorNovidadesBase extends UtilStorage with Store {
  @observable 
  ServiceStatus  statusConsultaNovidade = ServiceStatus.Waiting;

  @observable 
  ServiceStatus  statusConsultaPost = ServiceStatus.Waiting;

  @observable 
  String novoPost = "";
  @observable 
  String editandoPost = "";

  List<NovidadeBoticario> mNovidades = [], mBlogPosts = [];
  void editarPost(NovidadeBoticario post,{Function() sucesso, Function(String) falha, Function() carregando}){
    var index = mBlogPosts.indexOf(post);
      if(editandoPost.isEmpty ){
        falha?.call('A sua publicação não pode ser vazia');
    }else if(editandoPost.length > 280){
      falha?.call('A sua publicação não pode ter mais do que 280 caracteres');
    }else {
      statusConsultaPost = ServiceStatus.Waiting;
      
      post.message.content = editandoPost;
      updateNoBanco(post.toJson()).then((value) {
        mBlogPosts.removeAt(index);
        mBlogPosts.insert(index, post);
        novoPost = "";
        sucesso?.call();
        statusConsultaPost = ServiceStatus.Done;
      }).catchError((onError){
          statusConsultaPost = ServiceStatus.Done;
          falha?.call("Houve um problema ao tentar publicar");
      });
    }
  }
  void addNewPost({Function() sucesso, Function(String) falha, Function() carregando}){
    carregando?.call();
    if(novoPost.isEmpty ){
        falha?.call('A sua publicação não pode ser vazia');
    }else if(novoPost.length > 280){
      falha?.call('A sua publicação não pode ter mais do que 280 caracteres');
    }else {
      statusConsultaPost = ServiceStatus.Waiting;
      mBlogPosts.insert(0, NovidadeBoticario(user: GetIt.I.get<ControladorUsuario>().mUsuario,message: Message(content: novoPost,createdAt: DateTime.now())));
      salvarNoBanco(DataBaseKey.BLOGPOSTS,lista: mBlogPosts.map((e) => e.toJson()).toList()).then((value) {
        novoPost = "";
        sucesso?.call();
        statusConsultaPost = ServiceStatus.Done;
      }).catchError((onError){
          statusConsultaPost = ServiceStatus.Done;
          falha?.call("Houve um problema ao tentar publicar");
      });
    }
    
  }


  void consultarPosts({Function() sucesso, Function() falha}){
    statusConsultaPost = ServiceStatus.Waiting;
    // vamos montar os post's fakes :)
    queryLista<NovidadeBoticario>(DataBaseKey.BLOGPOSTS).then((posts) {
        mBlogPosts.clear();
        mBlogPosts.addAll(posts);
        sucesso?.call();
        mBlogPosts.sort((b,a)=>a.message.createdAt.compareTo(b.message.createdAt));
        statusConsultaPost = mBlogPosts.isEmpty ? ServiceStatus.Empty: ServiceStatus.Done;
    }).catchError((onError){
      falha?.call();
      statusConsultaPost = ServiceStatus.Error;

    });
    
}

  void consultarNovidades({Function() sucesso, Function() falha}){
    statusConsultaNovidade = ServiceStatus.Waiting;
    
    GetIt.I.get<ServiceProvider>().consultarNovidades().then((value){
        mNovidades.clear();
        mNovidades.addAll(value);
        sucesso?.call();
        statusConsultaNovidade = mNovidades.isEmpty ? ServiceStatus.Empty: ServiceStatus.Done;
    }).catchError((onError){
        statusConsultaNovidade = ServiceStatus.Error;
        falha?.call();
    });
  }
}