import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';
import 'package:microblog/model/UsuarioModel.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:microblog/util/BotaoPrimario.dart';
import 'package:microblog/util/PlaftformToolbar.dart';
import 'package:microblog/util/TextFieldPadrao.dart';
import 'package:microblog/util/TextWidgets.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  UsuarioModel mUsuarioRegistrar;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        titulo: "Criar uma conta",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap( 
                    runSpacing: 10,
                    children: [
                      TextHeadLine3("Digite os dados abaixo", corDarkMode: Colors.white,),
                      Divider(),
                      TextFieldPadrao(textLabel: "Nome",hintText: "Ex: João Paulo Santos Almeida",
                      onChanged: (x){
                        mUsuarioRegistrar.name = x;
                      },),
                      TextFieldPadrao(textLabel: "E-mail",hintText: "Ex: 789joaopaulo@gmail.com",
                      onChanged: (x){
                        mUsuarioRegistrar.email = x;
                      },),    
                      TextFieldPadrao(textLabel: "Senha",obscureText: true,
                      onChanged: (x){
                        mUsuarioRegistrar.password = x;
                      },),
                      Divider(),
                      BotaoPrimario(onTap: () {
                                GetIt.I.get<ControladorUsuario>().registrarNovoUsuario(mUsuarioRegistrar,
                                sucesso: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(context, 'routeName');
                                },carregando: () => AppUtil().showLoading(context),
                                falha: (erro) {
                                  Navigator.pop(context);
                                  AppUtil().showRecado(context,erro);
                                },);
                              },value: "Registrar",)
                    ],
                  ),
              ),
            ),
              
            ],
          ),
        ),
    );
  }
}
