import 'package:flutter/material.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:microblog/util/TextWidgets.dart';

class BotaoSecundario extends StatelessWidget {
  final String value;
  final botaoBordaPrimaria;
  final bool fullWidth;
  final Function() onTap;
  final double height;
  final IconData iconStart;
  final IconData iconEnd;
  final Color corTextoBotao;
  const BotaoSecundario({
    Key key,
    this.value,
    this.onTap, this.botaoBordaPrimaria = false, this.fullWidth = true, this.height, this.iconStart, this.iconEnd, this.corTextoBotao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: fullWidth ? double.maxFinite:null,
      child: RaisedButton(
        visualDensity: VisualDensity.compact,
        onPressed: onTap,
        disabledColor: AppUtil().appBrightness == Brightness.dark
            ? Colors.transparent
            : Colors.white,
        color: AppUtil().appBrightness == Brightness.dark
            ? Colors.transparent
            : Colors.white,
        child: Padding(padding: !fullWidth ? EdgeInsets.only(left:16,right: 16):EdgeInsets.zero,
        child: iconStart == null && iconEnd == null ? TextButtonApp(
              this.value == null ? "" : this.value,
              customColor: corTextoBotao != null ? corTextoBotao :
                  AppUtil().appBrightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
            ): Row(
          children: [
            iconStart != null ? Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(iconStart, color: AppUtil().appBrightness == Brightness.dark ? Colors.white: Colors.black,size: 24,),
            ):Container(),
            TextButtonApp(
              this.value == null ? "" : this.value,
              customColor:
                  corTextoBotao != null ? corTextoBotao : AppUtil().appBrightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
            ),
            iconEnd != null ? Icon(iconEnd, color: AppUtil().appBrightness == Brightness.dark ? Colors.white: Colors.black,size: 24):Container(),
          ],
        ),),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
                color:
                    AppUtil().appBrightness == Brightness.dark
                        ? this.botaoBordaPrimaria ? Theme.of(context).primaryColor : Colors.white
                        : Colors.grey)),
      ),
    );
  }
}