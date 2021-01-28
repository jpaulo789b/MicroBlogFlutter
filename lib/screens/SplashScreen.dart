import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.green[300]
          ),
          child: Center(child: Image.asset('lib/assets/logo.png', width: 200,)),
        ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    GetIt.I.get<ControladorUsuario>().consultarSeHaUsuarioLogado(
      possuiUsuario: () {
        Navigator.pushReplacementNamed(context, '/MainScreen');
      },naoPossuiUsuario: () {
        Navigator.pushReplacementNamed(context, '/LoginScreen');
      },);
  }
}
