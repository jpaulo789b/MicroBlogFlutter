import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/mobx/ControladorNovidades.dart';
import 'package:microblog/mobx/ControladorUsuario.dart';
import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:microblog/util/ModalEditarPost.dart';
import 'package:microblog/util/PlaftformToolbar.dart';
import 'package:microblog/util/ServiceStatus.dart';
import 'package:microblog/util/SkeletonPadrao.dart';
import 'package:microblog/util/TextWidgets.dart';
import 'package:microblog/util/UtilDataHora.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsCompanyScreen extends StatefulWidget {
  NewsCompanyScreen({Key key}) : super(key: key);

  @override
  _NewsCompanyScreenState createState() => _NewsCompanyScreenState();
}

class _NewsCompanyScreenState extends State<NewsCompanyScreen> {
  final _refreshController = RefreshController();
  final _newsController = GetIt.I.get<ControladorNovidades>();
  @override
  void initState() {
    _refresh();
    super.initState();
  }
  void _refresh() {
    _newsController.consultarNovidades(sucesso: () => _refreshController.refreshCompleted(),falha: () => _refreshController.refreshFailed(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        titulo: "Novidades",
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _refresh,
        physics: BouncingScrollPhysics(),
        header: WaterDropHeader(),
        child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Observer(
                // ignore: missing_return
                builder: (_) {
                  switch (_newsController.statusConsultaNovidade) {
                    case ServiceStatus.Waiting:
                      return Container(height: 200,child: SkeletonPadrao(),);
                    case ServiceStatus.Done:
                      return ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                        var novidade = _newsController.mNovidades[index];
                        return Novidade(novidade: novidade);
                      }, separatorBuilder: (context, index) => Divider(), itemCount: _newsController.mNovidades.length);
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
      ),
    );
  }
}

class Novidade extends StatelessWidget {
  const Novidade({
    Key key,
    @required this.novidade,
  }) : super(key: key);

  final NovidadeBoticario novidade;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      IntrinsicHeight(
        child: Row(children: [
          CircleAvatar(backgroundImage: NetworkImage(novidade.user.profilePicture ?? "https://d2q79iu7y748jz.cloudfront.net/s/_squarelogo/c1748f325a2ceebf43246d2cf9914293"),),
          VerticalDivider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextHeadLine2("${novidade.user.name}"),
                Visibility(
                  visible: GetIt.I.get<ControladorUsuario>().mUsuario.email == novidade.user.email,
                  child: IconButton(icon: Icon(Icons.edit), onPressed: () {
                    showEditarPost(context,novidade,(){});
                  },),
                )
              ],
            ),
          ),
        ],),
      ),
      SizedBox(height: 16,),
      TextBody1(novidade.message.content),
      Container(child: TextOverLine1(UtilDataHora.getDiaMesAnoHorasMinutos(dateTime: novidade.message.createdAt)),alignment: Alignment.centerRight,)
    ],);
  }
}
