import 'package:flutter/material.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:microblog/util/TextWidgets.dart';

class BotaoPrimario extends StatelessWidget {
  final String value;
  final Function() onTap;
  final bool enable;
  final bool fullWidth;
  final bool bordered;
  final Color corDefault;
  final double height;
  final IconData iconStart;
  final IconData iconEnd;
  final Color textColor;
  const BotaoPrimario({
    Key key, this.value, @required this.onTap, this.enable, this.fullWidth = true, this.bordered = false, this.corDefault, this.height, this.iconStart, this.iconEnd, this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: height ?? 50,
      width: fullWidth == null || fullWidth ?  double.maxFinite:null,
      child: RaisedButton(
        visualDensity: VisualDensity.compact,
        onPressed: enable != null && enable ? onTap: enable != null  && !enable ? null:onTap,
        color: corDefault ?? Theme.of(context).primaryColor,
        disabledColor:  Theme.of(context).primaryColor.withAlpha(90) ,
        child: Container(
          padding: !fullWidth ? EdgeInsets.only(left: 16,right: 16):null,
          alignment: Alignment.center,
          child: iconStart == null && iconEnd == null ? TextButtonApp("${value ?? ''}",customColor: textColor != null ? textColor : AppUtil().appBrightness == Brightness.light ? Colors.white:null, textAlign: TextAlign.center,): Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconStart != null ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(iconStart, color: Colors.white,size: 24,),
              ):Container(),
              TextButtonApp(
                "${value ?? ''}",
                customColor: textColor != null ? textColor : AppUtil().appBrightness == Brightness.light ? Colors.white:null, textAlign: TextAlign.center,
              ),
              iconEnd != null ? Icon(iconEnd, color: Colors.white,size: 24):Container(),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
                color: bordered ? Colors.grey : corDefault ?? Theme.of(context).primaryColor)),
      ),
    );
  }
}