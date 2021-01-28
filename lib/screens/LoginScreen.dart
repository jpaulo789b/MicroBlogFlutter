import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:microblog/util/BotaoPrimario.dart';
import 'package:microblog/util/BotaoSecundario.dart';
import 'package:microblog/util/PlaftformToolbar.dart';
import 'package:microblog/util/TextFieldPadrao.dart';
import 'package:microblog/util/TextWidgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mUsuario = "",mPassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        titulo: "Botícario Blog",
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                      Image.asset("lib/assets/logo_transparente.png",height: 75,),
                      TextHeadLine3("Acesse com usuário", corDarkMode: Colors.white,),
                      Divider(),
                      TextFieldPadrao(textLabel: "Usuário", onChanged: (text) {
                        mUsuario = text;
                      },),
                      TextFieldPadrao(textLabel: "Senha",obscureText: true, onChanged: (text) {
                        mPassword = text;
                      },),
                      Divider(),
                      BotaoPrimario(onTap: () {
                        GetIt.I.get<ControladorUsuario>().loginNoApp(mUsuario, mPassword,
                              carregando: AppUtil().showLoading(context),
                              sucesso: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, '/MainScreen');
                              },falha: (erro) {
                                Navigator.pop(context);
                                AppUtil().showRecado(context,erro);
                              },);
                      },value: "Acessar",)
                    ],
                  ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CircleAvatar(child: TextBody2("Ou", customColor: Colors.white,),),
                ),
                BotaoSecundario(onTap: () {
                        Navigator.pushNamed(context, '/RegisterScreen');
                      },value: "Criar uma conta",)
              ],
            )
          ],
        ),
      ),
    );
  }
}
