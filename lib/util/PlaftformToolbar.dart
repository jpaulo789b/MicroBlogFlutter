import 'package:flutter/material.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:microblog/util/TextWidgets.dart';


class PlatformAppBar extends StatefulWidget implements PreferredSizeWidget {
    final List<Widget> leadings;
    final List<Widget> actions;
    final Widget tituloWidget;
    final String titulo;
    final String subTitulo;
    final double elevation;
    final Color customColor;
    final bool corPrimaria;
    final PreferredSizeWidget bottom;
    final corPadrao;
    PlatformAppBar({Key key, this.leadings, this.actions, this.tituloWidget, this.titulo, this.subTitulo, this.customColor, this.elevation, this.corPrimaria, this.corPadrao, this.bottom}) : preferredSize = Size.fromHeight(kToolbarHeight*(bottom == null ? 1 : 2)), super(key: key);
    @override
    final Size preferredSize; // default is 56.0

    @override
    _PlatformAppBarState createState() => _PlatformAppBarState();
}

class _PlatformAppBarState extends State<PlatformAppBar>  with TickerProviderStateMixin {
final _controller = AppUtil();
  @override
  void initState() {
    super.initState();
  }

 
    @override
    Widget build(BuildContext context) {
        var eCorPrimaria = this.widget.corPrimaria != null && this.widget.corPrimaria;

        return  AppBar(
            //brightness: widget.corPrimaria ? Brightness.dark : _controller.brightnessApp == Brightness.dark ? Brightness.dark:Brightness.light,          
            leading: this.widget.leadings!= null ? Row(children: this.widget.leadings ,):null,
            actions: this.widget.actions ?? [],
            centerTitle: true,
            backgroundColor: eCorPrimaria ? Theme.of(context).primaryColor : this.widget.customColor,
            elevation: this.widget.elevation,
            iconTheme: IconThemeData(
              color:   eCorPrimaria ? Colors.white:  Colors.transparent == this.widget.customColor ? Theme.of(context).iconTheme.color : null
            ),
            title: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center, 
              children:  <Widget>[
                this.widget.titulo != null ? TextHeader(this.widget.titulo,style: Theme.of(context).appBarTheme.textTheme.headline6.apply(color: eCorPrimaria ? Colors.white:null ),customColor: eCorPrimaria ? Colors.white:null,) : this.widget.tituloWidget,
                this.widget.subTitulo == null ? Container():TextOverLine1(this.widget.subTitulo,style: Theme.of(context).appBarTheme.textTheme.caption.apply(color: eCorPrimaria ? Colors.white:_controller.appBrightness == Brightness.dark ? Colors.white:Colors.black ),customColor: eCorPrimaria ? Colors.white:null,)
              ],
            ),
            bottom: widget.bottom,
          );
    }
}