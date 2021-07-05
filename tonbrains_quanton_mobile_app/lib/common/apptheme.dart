import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color nearlyWhite2 = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color black = Color(0xFF000000);
  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color facebookBlue = Color(0xFF3b5998);
  static const Color googleRed = Color(0xFFF44336);

  static const Color darkText = Color(0xFF1e2022);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color primaryGreen = Colors.green;
  static const Color primaryRed = Color(0xFFee1c29);
  static const Color orange = Colors.orange;
  static const Color blue = Colors.blue;
  static const Color red = Colors.red;
  static const String fontName = 'Roboto';
  static const String fontNameWorkSans = 'WorkSans';
  static const String fontGoodTimes = 'goodtimes';
  static const Color background = Color(0xFFF2F3F8);
  static const Color brandGrey = Color(0xFF677788);

  //677788

  static const TextTheme textTheme = TextTheme(
    headline1: headline,
    headline2: headline,
    subtitle1: subtitle,
    subtitle2: subtitle,
    bodyText1: body1,
    bodyText2: body2,
    // body2: body2,
    //  body2: body2,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    //fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    //fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    // fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    // fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    // fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    //fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextTheme textThemeAppBar = TextTheme(
    headline1: headlineAppBar,
    headline2: headlineAppBar,
    headline3: headlineAppBar,
    headline4: headlineAppBar,
    headline5: headlineAppBar,
    headline6: headlineAppBar6,
    subtitle1: subtitleAppBar,
    subtitle2: subtitleAppBar,
    bodyText1: body1AppBar,
    bodyText2: body2AppBar,
    // body2: body2,
    //  body2: body2,
    caption: captionAppBar,
  );

  static const TextStyle display1AppBar = TextStyle(
    // h4 -> display1
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: primaryRed,
  );

  static const TextStyle headlineAppBar = TextStyle(
    // h5 -> headline
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: primaryRed,
  );

  static const TextStyle headlineAppBar6 = TextStyle(
    // h5 -> headline
    fontFamily: fontGoodTimes,
    //fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.97,
    color: primaryRed,
  );

  static const TextStyle titleAppBar = TextStyle(
    // h6 -> title
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: primaryRed,
  );

  static const TextStyle subtitleAppBar = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: primaryRed,
  );

  static const TextStyle body2AppBar = TextStyle(
    // body1 -> body2
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    letterSpacing: 0.2,
    color: primaryRed,
  );

  static const TextStyle body1AppBar = TextStyle(
    // body2 -> body1
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: primaryRed,
  );

  static const TextStyle captionAppBar = TextStyle(
    // Caption -> caption
    fontFamily: fontGoodTimes,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
