import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorNovidades.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';
import 'package:microblog/retrofit/DioConection.dart';
import 'package:microblog/retrofit/ServiceProvider.dart';
import 'package:microblog/util/ControladorNoSQL.dart';

GetIt getIt = GetIt.instance;
initGetIt() async {
  var dioConnect = DioConection().getDio();

  getIt.registerSingleton<ControladorNoSQL>(ControladorNoSQL());
  await GetIt.I.get<ControladorNoSQL>().initDatabase();
  getIt.registerSingleton<ControladorNovidades>(ControladorNovidades());
  getIt.registerSingleton<ControladorUsuario>(ControladorUsuario());
  getIt.registerSingleton<ServiceProvider>(ServiceProvider(dioConnect));

}