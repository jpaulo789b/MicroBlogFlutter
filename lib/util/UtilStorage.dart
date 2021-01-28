import 'package:get_it/get_it.dart';
import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:microblog/model/UsuarioModel.dart';
import 'package:microblog/util/ControladorNoSQL.dart';
import 'package:sembast/sembast.dart';

abstract class UtilStorage {
  var store = StoreRef.main();
  
  Future<bool> updateNoBanco(Map<String,dynamic> objeto){
    return store.record(objeto["ref"]).put(GetIt.I.get<ControladorNoSQL>().getDb,objeto).then((value){
          return true;
    }).catchError((onError){
      return false;
    });
  }
  
  Future<bool> salvarNoBanco(DataBaseKey keyRef,{List<Map<String,dynamic>> lista, Map<String,dynamic> objeto}) async {
    if(objeto != null){
      return store.record(dataBaseKeyName(keyRef)).put(GetIt.I.get<ControladorNoSQL>().getDb, objeto).then((value){
          return true;
      }).catchError((onError){
        return false;
      });
    } else if(lista != null) {
      //  var dbT = await GetIt.I.get<ControladorNoSQL>().getDb.transaction((transaction) => null);
      return intMapStoreFactory.store(dataBaseKeyName(keyRef)).addAll(GetIt.I.get<ControladorNoSQL>().getDb, lista).then((value){
        return true;
      }).catchError((onError){
        return false;
      });
    }else {
      return Future.value(false);
    }
  }

  Future<List<T>> queryLista<T>(DataBaseKey keyRef, {Function sucesso(List<T> items)}){
    List<T> queryResult = [];
    return intMapStoreFactory.store(dataBaseKeyName(keyRef)).find(GetIt.I.get<ControladorNoSQL>().getDb).then((values){
      values.forEach((record) {
        
        queryResult.add(unmarshal(record.value,type: T,ref: record.key));
      });
      sucesso?.call(queryResult);
      return queryResult;
    }).catchError((onError){
      return Future.value(queryResult);
    });
  }

  Future<bool> removerDoBanco(DataBaseKey keyRef){
    return store.record(dataBaseKeyName(keyRef)).delete(GetIt.I.get<ControladorNoSQL>().getDb).then((value) 
      => true
      ).catchError((onError)
      => false
    );
  }

  Future<T> queryObjeto<T>(DataBaseKey keyRef,{Function sucesso(dynamic item)}){
    
    return store.record(dataBaseKeyName(keyRef)).get(GetIt.I.get<ControladorNoSQL>().getDb).then((value){
    sucesso?.call(unmarshal(value as Map,type: T));
      return unmarshal(value as Map,type: T);
    }).catchError((onError){
      return Future.value(null);
    }).then((value) => value as T);
  }
  
}


String dataBaseKeyName(DataBaseKey key)=>key.toString().split('.').last;

enum DataBaseKey {
  USERS,
  LOCALUSER,
  BLOGPOSTS,
  POST
}


T unmarshal<T>(Map map, {Type type, num ref}) {
  if (type == null) {
    type = T;    
  }

  switch (type) {
    case NovidadeBoticario:
      NovidadeBoticario temp = NovidadeBoticario.fromJson(map);
      temp.ref = ref;
      return temp as T;
    case UsuarioModel:
      return UsuarioModel.fromJson(map) as T;
    default:
      throw StateError('Unable to unmarshal value of type \'$type\'');
  }
}
