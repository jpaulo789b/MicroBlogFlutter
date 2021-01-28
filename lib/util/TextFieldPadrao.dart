import 'package:flutter/material.dart';
import 'package:microblog/util/TextStyles.dart';
import 'package:microblog/util/TextWidgets.dart';
class TextFieldPadrao extends StatelessWidget {
  final Function(String text) onChanged;
  final String hintText;
  final Widget prefix;
  final Widget sufix;
  final Widget sufixButtom;
  final TextInputType inputType;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final bool autoFocus;
  final String textLabel;
  final String valorNoCampo;
  final EdgeInsets padding;
  final int widthInput;
  final Function onClick;
  final int maxLines;
  final int minLines;
  final double radius;
  final bool editable;
  final TextEditingController controlller;
  final String suffixText;
  final FocusNode focusNode;
  final TextAlign textAlign;
  final bool enable;
  const TextFieldPadrao(
      {Key key,
      this.onChanged,
      this.hintText,
      this.prefix,
      this.sufix,
      this.autoFocus,
      this.inputType,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.textLabel,
      this.sufixButtom, this.valorNoCampo, this.padding, this.widthInput, this.onClick, this.maxLines, this.minLines, this.radius = 20, this.controlller, this.suffixText, this.focusNode, this.textAlign = TextAlign.start, this.enable, this.editable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tamanhoPadraoLinha = 42.0;
    var tamanoRadius = minLines == null ? radius : 10.0;
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLabel != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 13.0),
                        child: TextBody2(
                          this.textLabel,
                          weight: FontWeight.bold,
                        ),
                      )
                    : Container(),
                ConstrainedBox(
                  constraints: new BoxConstraints(
                    minHeight: tamanhoPadraoLinha,
                    maxHeight: minLines != null ?  tamanhoPadraoLinha*minLines:tamanhoPadraoLinha
                  ),
                  child: Container(
                    child: TextField(
                      textAlign: textAlign,
                      onTap: onClick,
                      focusNode: (editable ?? true)  ? focusNode:AlwaysDisabledFocusNode(),
                      enabled: this.enable ?? true,
                      controller : controlller !=null ? controlller: valorNoCampo != null ? TextEditingController(text: valorNoCampo) : null,
                      readOnly: onClick != null,
                      onChanged: onChanged,
                      maxLines: maxLines ?? 1,
                      minLines: minLines,
                      
                      keyboardType: this.inputType,
                      style: TextUtil.stylebody2(),
                      autofocus: autoFocus ?? false,
                      obscureText: obscureText ?? false,
                      decoration: InputDecoration(

                          contentPadding: EdgeInsets.only(left: 10, right: 10, top: minLines != null ? 5:2),
                          prefix: prefix,
                          suffix: sufix,
                          suffixText: suffixText,
                          suffixStyle: TextUtil.styleoverLine1(),
                          prefixIcon: prefixIcon,
                          suffixIcon: suffixIcon,
                          isDense: false,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(tamanoRadius)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey[900]),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(tamanoRadius)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey[900]),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey[900]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(tamanoRadius),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextUtil.stylebody2().apply(color: Colors.white60),
                          hintText: this.hintText ?? "",
                          fillColor: Theme.of(context).cardColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        sufixButtom ?? Container(),
      ],
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}