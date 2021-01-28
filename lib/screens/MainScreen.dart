import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorNovidades.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';
import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:microblog/screens/NewsCompanyScreen.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:microblog/util/BotaoPrimario.dart';
import 'package:microblog/util/PlaftformToolbar.dart';
import 'package:microblog/util/ServiceStatus.dart';
import 'package:microblog/util/SkeletonPadrao.dart';
import 'package:microblog/util/TextFieldPadrao.dart';
import 'package:microblog/util/TextWidgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _newsController = GetIt.I.get<ControladorNovidades>();
  final _refreshController = RefreshController();
    @override
  void initState() {
    _refresh();
    super.initState();
  }
   void _refresh() {
    _newsController.consultarPosts(sucesso: () => _refreshController.refreshCompleted(),falha: () => _refreshController.refreshFailed(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        titulo: "Bem vindo ao Botícario Blog",
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.bullhorn), onPressed: () {
            Navigator.pushNamed(context, '/NewsCompanyScreen');
          },)
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _refresh,
        physics: BouncingScrollPhysics(),
        header: WaterDropHeader(),
        child:SingleChildScrollView(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ItemManterPost(),
                Divider(),
                Observer(
                  // ignore: missing_return
                  builder: (_) {
                  switch (_newsController.statusConsultaPost) {
                    case ServiceStatus.Waiting:
                      return Container(height: 200,child: SkeletonPadrao(),);
                    case ServiceStatus.Done:
                      return ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                        var novidade = _newsController.mBlogPosts[index];
                        return Novidade(novidade: novidade);
                      }, separatorBuilder: (context, index) => Divider(), itemCount: _newsController.mBlogPosts.length);
                    case ServiceStatus.Error:
                      return Center(child: TextHeadLine1("Ops! não foi possível completar a solicitação"),);
                    case ServiceStatus.Empty:
                      return Center(child: TextHeadLine1("Ainda não há novidades, volte mais tarde"),);
                    default:Container();
                  }
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}


class ItemManterPost extends StatefulWidget {
  final NovidadeBoticario mPost;
  ItemManterPost({Key key, this.mPost}) : super(key: key);

  @override
  _ItemManterPostState createState() => _ItemManterPostState();
}

class _ItemManterPostState extends State<ItemManterPost> {
  final _newsController = GetIt.I.get<ControladorNovidades>();
  @override
  void initState() {
    _newsController.editandoPost = "";
    if(widget.mPost != null){
        _newsController.editandoPost = widget.mPost.message.content;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(visible:widget.mPost != null,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: TextHeader("Editar publicação"),),
                      ),),
                      Row(
                        children: [
                          CircleAvatar(backgroundImage: NetworkImage(GetIt.I.get<ControladorUsuario>().mUsuario.profilePicture),),
                          VerticalDivider(),
                          TextHeadLine2("${GetIt.I.get<ControladorUsuario>().mUsuario.name}")
                        ],
                      ),
                      Divider(),
                      TextFieldPadrao(
                         valorNoCampo:widget.mPost != null ? _newsController.editandoPost: _newsController.novoPost,
                         textLabel: "Seu post",minLines: 3,maxLines: 6,hintText: "Digite...",onChanged: (text) {
                        if(widget.mPost == null)
                          _newsController.novoPost = text;
                        else 
                           _newsController.editandoPost = text;
                      },),
                      Observer(builder: (_) {return TextOverLine1("${_newsController.novoPost.length}/280",customColor: _newsController.novoPost.length>280 ? Colors.red:null,);},),
                      Container(
                        height: 36,
                        width: 120,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(top: 8),
                        child: BotaoPrimario(onTap: () {
                          if(widget.mPost == null){
                            _newsController.addNewPost(carregando: AppUtil().showLoading(context),sucesso: () {
                               Navigator.popUntil(context, ModalRoute.withName('/MainScreen'));
                              setState(() {

                              });
                            },falha: (x) {
                              Navigator.pop(context);
                              AppUtil().showRecado(context, x);
                            },);
                          }else {
                             _newsController.editarPost(widget.mPost,carregando: AppUtil().showLoading(context),sucesso: () {
                               Navigator.popUntil(context, ModalRoute.withName('/MainScreen'));
                              setState(() {

                              });
                            },falha: (x) {
                              Navigator.pop(context);
                              AppUtil().showRecado(context, x);
                            },);
                          }

                        },value: widget.mPost != null ? "Atualizar" :"Publicar",fullWidth: false,),
                      )
                    ],
                  ),
                ),);
  }
}