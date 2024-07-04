import 'package:flutter/material.dart';


class Colours {
  static const primarygreen = const Color(0xff006837);
  static const fillcolor =  Color(0xffD9D9D9);
  static const boxGrey =  Color(0xffF1F1F1);

}

Padding pad({double? horizontal, double? vertical, required Widget child}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0, vertical: vertical ?? 0),
    child: child,
  );
}

double containerRadius = 24;

var outLineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    width: 1,
    color: Color(0xff000000).withOpacity(0.1),
  ),
);

var outLineBorder3 = UnderlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);
var outLineBorder2 = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);
var couponCodebrdr = OutlineInputBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10.0),
    bottomLeft: Radius.circular(10.0),
  ),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);





InputDecoration searchTFieldDec({required String hnt, required Widget prefix}) {
  return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: prefix,
      ),
      contentPadding: EdgeInsets.only(left: 10),
      border: outLineBorder,
      enabledBorder: outLineBorder,
      focusedBorder: outLineBorder,
      filled: true,
      fillColor: Colors.transparent,
      errorStyle: TextStyle(fontSize: 0),
      hintText: hnt,
      hintStyle: TextStyles.textStyle10);
}



InputDecoration inputDec3({required String hnt,Widget? suffix}) {
  return InputDecoration(
    suffix: suffix,
      contentPadding: EdgeInsets.only(left: 10),
      border: outLineBorder,
      enabledBorder: outLineBorder,
      filled: true,
      fillColor: Colours.fillcolor.withOpacity(0.25),
      errorStyle: TextStyle(fontSize: 0),
      hintText: hnt,
      hintStyle: TextStyles.textStyle4);
}


class StringConstants {
  static const String token = "token";
  static const String apiBaseUrl = "https://flutter-amr.noviindus.in/api/";





}

// var linearGrad = LinearGradient(colors: [
//   Color(0xff2E3192),
//   Color(0xff4D51C7),
// ], begin: Alignment.bottomCenter, end: Alignment.topCenter);


// var linearGrad2 = LinearGradient(colors: [
//   Color(0xff4D51C7),
//   Color(0xff2E3192),
// ], begin: Alignment.bottomCenter, end: Alignment.topCenter);

// var linearGrad3 = LinearGradient(colors: [
//
// Color(0xffFBFBFB),
//   Color(0xffE9E9E9),
// ], begin: Alignment.centerLeft, end: Alignment.centerRight);


// var linearGrad4 = LinearGradient(colors: [
//
// Color(0xffD60000),
//   Color(0xffA40000),
// ], begin: Alignment.centerLeft, end: Alignment.centerRight);

verticalSpace(double size) {
  return SizedBox(height: size);
}

horizontalSpace(double size) {
  return SizedBox(width: size);
}



class TextStyles {
  static String fontFam = "Poppins";

  static const textStyle = TextStyle(
      color: const Color(0xff444444),
      fontWeight: FontWeight.w700,
      fontFamily: "NunitoSans",
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      height: 1);
  static final textStyle2 = TextStyle(
      color: const Color(0xff404040),
      fontWeight: FontWeight.w600,
      fontFamily: fontFam,
      fontStyle: FontStyle.normal,
      fontSize: 24.0,
      );
  static final textStyle3 = TextStyle(
    color: const Color(0xff404040),

    fontWeight: FontWeight.w400,
      fontFamily: fontFam,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
     );  static final textStyle4 = TextStyle(
    color: const Color(0xff000000).withOpacity(0.4),
    fontWeight: FontWeight.w400,
      fontFamily: fontFam,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
     ); static final textStyle4b = TextStyle(
    color: const Color(0xff000000).withOpacity(0.2),
    fontWeight: FontWeight.w400,
      fontFamily: fontFam,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
     );
     static final textStyle5 = TextStyle(
    color: const Color(0xffFFFFFF),
    fontWeight: FontWeight.w600,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 17.0,
     ); static final textStyle5b = TextStyle(
    color: const Color(0xffFFFFFF),
    fontWeight: FontWeight.w500,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 12.0,
     );     static final textStyle6 = TextStyle(
    color: const Color(0xff000000),
    fontWeight: FontWeight.w500,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 18.0,
     );     static final textStyle7 = TextStyle(
    color: const Color(0xff006837),
    fontWeight: FontWeight.w300,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 16.0,
     );     static final textStyle8 = TextStyle(
    color: const Color(0xff000000).withOpacity(0.5),
    fontWeight: FontWeight.w400,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 15.0,
     );    static final textStyle9 = TextStyle(
    color: const Color(0xff000000),
    fontWeight: FontWeight.w300,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 16.0,
     );   static final textStyle10 = TextStyle(
    color: const Color(0xff000000).withOpacity(0.2),
    fontWeight: FontWeight.w400,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 12.0,
     );  static final textStyle11 = TextStyle(
    color: const Color(0xff000000),
    fontWeight: FontWeight.w500,
      fontFamily: fontFam,
      // fontStyle: FontStyle.normal,
      fontSize: 15.0,
     );

}
