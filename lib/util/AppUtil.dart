import 'package:flutter/material.dart';
import 'package:microblog/util/BotaoPrimario.dart';
import 'package:microblog/util/TextWidgets.dart';

class AppUtil {
  static final AppUtil _singleton = AppUtil._internal();

  BuildContext rootAppContext;

  Brightness get appBrightness => WidgetsBinding.instance.window.platformBrightness;

  factory AppUtil() {
    
    return _singleton;
  }

  AppUtil._internal();

showRecado(BuildContext context,String recado){
        showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext _) {
          return Center(
            child: Card(
                margin: EdgeInsets.all(32),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         TextHeader("Ops!"),
                         Divider(),
                         TextBody1(recado),
                         SizedBox(height: 24,),
                         BotaoPrimario(onTap: () {
                            Navigator.pop(context);
                         },value: "Entendido",)
                      ],
                    ),
                ),
                ),
          );
        });
  }

  showLoading(BuildContext context){
        showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) {
          return WillPopScope(
            onWillPop: () => null,
            child: Center(
              child: Container(
                  width: 50,
                  height: 50,
                  child: 
                  CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Theme.of(rootAppContext).primaryColor),
                  ),
                  ),
            ),
          );
        });
  }

}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    if(hexString == null) return null;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String colorToHex(Color color) {
     String hexString = '#' + color.value.toRadixString(16);
          hexString = hexString.substring(2, hexString.length);
          return hexString;
  }
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}