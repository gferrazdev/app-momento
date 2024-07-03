import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_colors.dart';

class ThemeTextStyles {
  ThemeTextStyles._();

  //Texto preto 20
  static TextStyle get getBlack20Style =>
      TextStyle(fontSize: 20.sp, color: Colors.black, fontFamily: "Unimed");
  static TextStyle get getBlack20BoldStyle =>
      getBlack20Style.copyWith(fontWeight: FontWeight.bold);
  //Texto preto 25
  static TextStyle get getBlack25Style =>
      getBlack20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getBlack25BoldStyle =>
      getBlack20BoldStyle.copyWith(fontSize: 25.sp);
  //Texto preto 30
  static TextStyle get getBlack30Style =>
      getBlack20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getBlack30BoldStyle =>
      getBlack20Style.copyWith(fontSize: 30.sp);
  //Texto preto 35
  static TextStyle get getBlack35Style =>
      getBlack20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getBlack35BoldStyle =>
      getBlack20BoldStyle.copyWith(fontSize: 35.sp);
  //Texto preto 40
  static TextStyle get getBlack40Style =>
      getBlack20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getBlack40BoldStyle =>
      getBlack20BoldStyle.copyWith(fontSize: 40.sp);
  //Texto preto 45
  static TextStyle get getBlack45Style =>
      getBlack20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getBlack45BoldStyle =>
      getBlack20BoldStyle.copyWith(fontSize: 45.sp);
  //Texto preto 50
  static TextStyle get getBlack50Style =>
      getBlack20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getBlack50BoldStyle =>
      getBlack20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto preto claro 20
  static TextStyle get getLightBlack20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.lightBlack, fontFamily: "Unimed");
  static TextStyle get getLightBlack20BoldStyle =>
      getLightBlack20Style.copyWith(fontWeight: FontWeight.bold);
  //Texto preto claro 25
  static TextStyle get getLightBlack25Style =>
      getLightBlack20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getLightBlack25BoldStyle =>
      getLightBlack20BoldStyle.copyWith(fontSize: 25.sp);
  //Texto preto claro 30
  static TextStyle get getLightBlack30Style =>
      getLightBlack20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getLightBlack30BoldStyle =>
      getLightBlack20BoldStyle.copyWith(fontSize: 30.sp);
  //Texto preto claro 35
  static TextStyle get getLightBlack35Style =>
      getLightBlack20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getLightBlack35BoldStyle =>
      getLightBlack20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getLightBlack40Style =>
      //Texto preto claro 40
      getLightBlack20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getLightBlack40BoldStyle =>
      getLightBlack20BoldStyle.copyWith(fontSize: 40.sp);
  //Texto preto claro 45
  static TextStyle get getLightBlack45Style =>
      getLightBlack20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getLightBlack45BoldStyle =>
      getLightBlack20BoldStyle.copyWith(fontSize: 45.sp);
  //Texto preto claro 50
  static TextStyle get getLightBlack50Style =>
      getLightBlack20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getLightBlack50BoldStyle =>
      getLightBlack20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto cinza 20
  static TextStyle get getGrey20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.cinzaPadrao, fontFamily: "Unimed");
  static TextStyle get getGrey20BoldStyle =>
      getGrey20Style.copyWith(fontWeight: FontWeight.bold);
  //Texto cinza 25
  static TextStyle get getGrey25Style =>
      getGrey20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getGrey25BoldStyle =>
      getGrey20BoldStyle.copyWith(fontSize: 25.sp);
  //Texto cinza 30
  static TextStyle get getGrey30Style =>
      getGrey20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getGrey30BoldStyle =>
      getGrey20BoldStyle.copyWith(fontSize: 30.sp);
  //Texto cinza 35
  static TextStyle get getGrey35Style =>
      getGrey20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getGrey35BoldStyle =>
      getGrey20BoldStyle.copyWith(fontSize: 35.sp);
  //Texto cinza 40
  static TextStyle get getGrey40Style =>
      getGrey20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getGrey40BoldStyle =>
      getGrey20BoldStyle.copyWith(fontSize: 40.sp);
  //Texto cinza 45
  static TextStyle get getGrey45Style =>
      getGrey20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getGrey45BoldStyle =>
      getGrey20BoldStyle.copyWith(fontSize: 45.sp);
  //Texto cinza 50
  static TextStyle get getGrey50Style =>
      getGrey20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getGrey50BoldStyle =>
      getGrey20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto cinza escuro
  static TextStyle get getBoldGrey20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.cinzaEscuro, fontFamily: "Unimed");
  static TextStyle get getBoldGrey20BoldStyle =>
      getBoldGrey20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getBoldGrey25Style =>
      getBoldGrey20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getBoldGrey25BoldStyle =>
      getBoldGrey20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getBoldGrey30Style =>
      getBoldGrey20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getBoldGrey30BoldStyle =>
      getBoldGrey20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getBoldGrey35Style =>
      getBoldGrey20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getBoldGrey35BoldStyle =>
      getBoldGrey20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getBoldGrey40Style =>
      getBoldGrey20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getBoldGrey40BoldStyle =>
      getBoldGrey20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getBoldGrey45Style =>
      getBoldGrey20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getBoldGrey45BoldStyle =>
      getBoldGrey20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getBoldGrey50Style =>
      getBoldGrey20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getBoldGrey50BoldStyle =>
      getBoldGrey20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto verde Padrao
  static TextStyle get getGreen20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.verdePadrao, fontFamily: "Unimed");
  static TextStyle get getGreen20BoldStyle =>
      getGreen20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getGreen25Style =>
      getGreen20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getGreen25BoldStyle =>
      getGreen20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getGreen30Style =>
      getGreen20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getGreen30BoldStyle =>
      getGreen20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getGreen35Style =>
      getGreen20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getGreen35BoldStyle =>
      getGreen20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getGreen40Style =>
      getGreen20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getGreen40BoldStyle =>
      getGreen20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getGreen45Style =>
      getGreen20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getGreen45BoldStyle =>
      getGreen20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getGreen50Style =>
      getGreen20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getGreen50BoldStyle =>
      getGreen20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto verde escuro
  static TextStyle get getBoldGreen20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.verdeEscuro, fontFamily: "Unimed");
  static TextStyle get getBoldGreen20BoldStyle =>
      getBoldGreen20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getBoldGreen25Style =>
      getBoldGreen20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getBoldGreen25BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getBoldGreen30Style =>
      getBoldGreen20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getBoldGreen30BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getBoldGreen35Style =>
      getBoldGreen20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getBoldGreen35BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getBoldGreen40Style =>
      getBoldGreen20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getBoldGreen40BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getBoldGreen45Style =>
      getBoldGreen20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getBoldGreen45BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getBoldGreen50Style =>
      getBoldGreen20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getBoldGreen50BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 50.sp);
  static TextStyle get getBoldGreen55Style =>
      getBoldGreen20Style.copyWith(fontSize: 55.sp);
  static TextStyle get getBoldGreen55BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 55.sp);
  static TextStyle get getBoldGreen60Style =>
      getBoldGreen20Style.copyWith(fontSize: 60.sp);
  static TextStyle get getBoldGreen60BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 60.sp);
  static TextStyle get getBoldGreen65Style =>
      getBoldGreen20Style.copyWith(fontSize: 65.sp);
  static TextStyle get getBoldGreen65BoldStyle =>
      getBoldGreen20BoldStyle.copyWith(fontSize: 65.sp);

  //Texto branco
  static TextStyle get getWhite20Style =>
      TextStyle(fontSize: 20.sp, color: Colors.white, fontFamily: "Unimed");
  static TextStyle get getWhite20BoldStyle =>
      getWhite20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getWhite25Style =>
      getWhite20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getWhite25BoldStyle =>
      getWhite20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getWhite30Style =>
      getWhite20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getWhite30BoldStyle =>
      getWhite20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getWhite35Style =>
      getWhite20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getWhite35BoldStyle =>
      getWhite20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getWhite40Style =>
      getWhite20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getWhite40BoldStyle =>
      getWhite20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getWhite45Style =>
      getWhite20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getWhite45BoldStyle =>
      getWhite20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getWhite50Style =>
      getWhite20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getWhite50BoldStyle =>
      getWhite20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto roxo
  static TextStyle get getPurple20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.roxoPadrao, fontFamily: "Unimed");
  static TextStyle get getPurple20BoldStyle =>
      getPurple20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getPurple25Style =>
      getPurple20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getPurple25BoldStyle =>
      getPurple20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getPurple30Style =>
      getPurple20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getPurple30BoldStyle =>
      getPurple20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getPurple35Style =>
      getPurple20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getPurple35BoldStyle =>
      getPurple20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getPurple40Style =>
      getPurple20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getPurple40BoldStyle =>
      getPurple20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getPurple45Style =>
      getPurple20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getPurple45BoldStyle =>
      getPurple20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getPurple50Style =>
      getPurple20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getPurple50BoldStyle =>
      getPurple20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto roxo claro
  static TextStyle get getLightPurple20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.roxoClaro, fontFamily: "Unimed");
  static TextStyle get getLightPurple20BoldStyle =>
      getLightPurple20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getLightPurple25Style =>
      getLightPurple20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getLightPurple25BoldStyle =>
      getLightPurple20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getLightPurple30Style =>
      getLightPurple20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getLightPurple30BoldStyle =>
      getLightPurple20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getLightPurple35Style =>
      getLightPurple20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getLightPurple35BoldStyle =>
      getLightPurple20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getLightPurple40Style =>
      getLightPurple20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getLightPurple40BoldStyle =>
      getLightPurple20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getLightPurple45Style =>
      getLightPurple20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getLightPurple45BoldStyle =>
      getLightPurple20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getLightPurple50Style =>
      getLightPurple20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getLightPurple50BoldStyle =>
      getLightPurple20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto error
  static TextStyle get getError20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.errorColor, fontFamily: "Unimed");
  static TextStyle get getError20BoldStyle =>
      getError20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getError25Style =>
      getError20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getError25BoldStyle =>
      getError20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getError30Style =>
      getError20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getError30BoldStyle =>
      getError20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getError35Style =>
      getError20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getError35BoldStyle =>
      getError20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getError40Style =>
      getError20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getError40BoldStyle =>
      getError20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getError45Style =>
      getError20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getError45BoldStyle =>
      getError20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getError50Style =>
      getError20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getError50BoldStyle =>
      getError20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto amarelo
  static TextStyle get getVerdeClaro20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.verdeClaro, fontFamily: "Unimed");
  static TextStyle get getVerdeClaro20BoldStyle =>
      getVerdeClaro20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getVerdeClaro25Style =>
      getVerdeClaro20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getVerdeClaro25BoldStyle =>
      getVerdeClaro20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getVerdeClaro30Style =>
      getVerdeClaro20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getVerdeClaro30BoldStyle =>
      getVerdeClaro20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getVerdeClaro35Style =>
      getVerdeClaro20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getVerdeClaro35BoldStyle =>
      getVerdeClaro20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getVerdeClaro40Style =>
      getVerdeClaro20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getVerdeClaro40BoldStyle =>
      getVerdeClaro20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getVerdeClaro45Style =>
      getVerdeClaro20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getVerdeClaro45BoldStyle =>
      getVerdeClaro20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getVerdeClaro50Style =>
      getVerdeClaro20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getVerdeClaro50BoldStyle =>
      getVerdeClaro20BoldStyle.copyWith(fontSize: 50.sp);

  //Texto rosa Padrao
  static TextStyle get getPink20Style => TextStyle(
      fontSize: 20.sp, color: ThemeColors.rosaPadrao, fontFamily: "Unimed");
  static TextStyle get getPink20BoldStyle =>
      getPink20Style.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get getPink25Style =>
      getPink20Style.copyWith(fontSize: 25.sp);
  static TextStyle get getPink25BoldStyle =>
      getPink20BoldStyle.copyWith(fontSize: 25.sp);
  static TextStyle get getPink30Style =>
      getPink20Style.copyWith(fontSize: 30.sp);
  static TextStyle get getPink30BoldStyle =>
      getPink20BoldStyle.copyWith(fontSize: 30.sp);
  static TextStyle get getPink35Style =>
      getPink20Style.copyWith(fontSize: 35.sp);
  static TextStyle get getPink35BoldStyle =>
      getPink20BoldStyle.copyWith(fontSize: 35.sp);
  static TextStyle get getPink40Style =>
      getPink20Style.copyWith(fontSize: 40.sp);
  static TextStyle get getPink40BoldStyle =>
      getPink20BoldStyle.copyWith(fontSize: 40.sp);
  static TextStyle get getPink45Style =>
      getPink20Style.copyWith(fontSize: 45.sp);
  static TextStyle get getPink45BoldStyle =>
      getPink20BoldStyle.copyWith(fontSize: 45.sp);
  static TextStyle get getPink50Style =>
      getPink20Style.copyWith(fontSize: 50.sp);
  static TextStyle get getPink50BoldStyle =>
      getPink20BoldStyle.copyWith(fontSize: 50.sp);
}
