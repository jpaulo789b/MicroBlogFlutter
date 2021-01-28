import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microblog/util/AppUtil.dart';


class TextUtil{

static TextSpan display1({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styledisplay1().copyWith(fontWeight: weight));

static TextSpan display2({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styledisplay2().copyWith(fontWeight: weight));

static TextSpan header({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleheader().copyWith(fontWeight: weight));

static TextSpan headLine1({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleheadLine1().copyWith(fontWeight: weight));

static TextSpan headLine2({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleheadLine2().copyWith(fontWeight: weight));

static TextSpan headLine3({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleheadLine3().copyWith(fontWeight: weight));

static TextSpan body1({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? stylebody1().copyWith(fontWeight: weight));

static TextSpan body1Chart({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? stylebody1Chart().copyWith(fontWeight: weight));

static TextSpan body2({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? stylebody2().copyWith(fontWeight: weight));

static TextSpan overLine1({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleoverLine1().copyWith(fontWeight: weight));

static TextSpan overLine2({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleoverLine2().copyWith(fontWeight: weight));

static TextSpan overLine3({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleoverLine2().copyWith(fontWeight: weight));

static TextSpan button({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? stylebutton().copyWith(fontWeight: weight));

static TextSpan action({String text,TextStyle style, FontWeight weight})=> TextSpan(text: text,style: style ?? styleaction().copyWith(fontWeight: weight));


    static TextStyle styledisplay1() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 64,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styledisplay2() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styledisplay3() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleheader() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleheadLine1() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleheadLine2() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleheadLine3() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#51555A"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle stylebody1() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#80858C"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle stylebody1Chart() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#FFFFFF"):HexColor.fromHex("#FFFFFF")
    );

    static TextStyle stylebody2() => GoogleFonts.nunitoSans(
        fontSize: 14,
        fontWeight:  FontWeight.normal,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#80858C"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleoverLine1() => GoogleFonts.nunitoSans(
        fontSize: 12,
        fontWeight:  FontWeight.normal,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#80858C"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleoverLine2() => GoogleFonts.nunitoSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#80858C"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle styleoverLine3() => GoogleFonts.nunitoSans(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#80858C"):HexColor.fromHex("#FFFFFF")
    );
    static TextStyle stylebutton() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight:  FontWeight.bold,
        color: AppUtil().appBrightness == Brightness.light ? HexColor.fromHex("#80858C"):HexColor.fromHex("#FFFFFF")
    );
    
    static TextStyle styleaction() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
    );

}
