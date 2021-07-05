import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/bottom_bar_view.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/fa_icon.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

import 'apptheme.dart';

Container titleGoodTimes(String value, [Color color = AppTheme.primaryRed]) {
  return Container(
    alignment: Alignment.centerRight,
    child: Text(value,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 11.5,
            fontFamily: AppTheme.fontGoodTimes)),
  );
}

Container titleGoodTimesMd(String value, [Color color = AppTheme.primaryRed]) {
  return Container(
    alignment: Alignment.center,
    child: Text(value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 11.5,
            fontFamily: AppTheme.fontGoodTimes)),
  );
}

Container titleGoodTimesSM(String value, [Color color = AppTheme.primaryRed]) {
  return Container(
    alignment: Alignment.center,
    child: Text(value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 9.5,
            fontFamily: AppTheme.fontGoodTimes)),
  );
}

Container titleNameWorkSansMd(String value,
    [Color color = AppTheme.primaryRed]) {
  return Container(
    alignment: Alignment.center,
    child: Text(value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 13.5,
            fontFamily: AppTheme.fontNameWorkSans)),
  );
}

Container titleNameWorkSansSM(String value,
    [Color color = AppTheme.primaryRed]) {
  return Container(
    alignment: Alignment.center,
    child: Text(value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 11.5,
            fontFamily: AppTheme.fontNameWorkSans)),
  );
}

Container titleNameWorkSansXS(String value,
    [Color color = AppTheme.primaryRed]) {
  return Container(
    alignment: Alignment.center,
    child: Text(value,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 9.5,
            fontFamily: AppTheme.fontNameWorkSans)),
  );
}

Text bodyText(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 13,
        color: AppTheme.brandGrey,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontFamily: AppTheme.fontNameWorkSans),
  );
}

Container bodyGoodTimesRight(String value,
    [Color color = AppTheme.nearlyBlack]) {
  return Container(
    // alignment: Alignment.centerRight,
    child: Text(value,
        textAlign: TextAlign.left,
        //overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: color,
            letterSpacing: 1,
            fontSize: 12.3,
            fontFamily: AppTheme.fontNameWorkSans)),
  );
}

Container titleGoodTimesRight(String value,
    [Color color = AppTheme.brandGrey]) {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(top: 10),
    child: Text(value,
        textAlign: TextAlign.right,
        //overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 2,
            fontSize: 9.5,
            fontStyle: FontStyle.italic,
            fontFamily: AppTheme.fontGoodTimes)),
  );
}

Widget navMenuItem(String value, IconData icon, Function onTap) {
  return ListTile(
      leading: FaIcon(icon,
          color: darkTheme ? AppDarkTheme.gray : AppTheme.lightText, size: 18),
      title: Text(value,
          style: TextStyle(
            fontSize: 16,
            fontFamily: AppTheme.fontNameWorkSans,
            // color: AppTheme.nearlyBlack
          )),
      onTap: onTap);
}

Text infoMesssage(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 16,
        // color: AppTheme.grey,
        fontFamily: AppTheme.fontNameWorkSans,
        fontStyle: FontStyle.normal),
  );
}

Text infoMesssageAlignLeft(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: 16,
        // color: AppTheme.grey,
        fontFamily: AppTheme.fontNameWorkSans,
        fontStyle: FontStyle.normal),
  );
}

Text infoMesssageSuperSmall(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 9,
        color: AppTheme.brandGrey,
        fontFamily: AppTheme.fontNameWorkSans,
        fontStyle: FontStyle.normal),
  );
}

Text infoMesssageSuperSmallLeft(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: 9,
        height: 1.5,
        color: AppTheme.brandGrey,
        fontFamily: AppTheme.fontNameWorkSans,
        fontStyle: FontStyle.normal),
  );
}

BoxDecoration listSeparatingBorder(BuildContext context, {bool isUp = false}) {
  return BoxDecoration(
      border: isUp
          ? Border(top: BorderSide(color: AppTheme.nearlyWhite2))
          : Border(bottom: BorderSide(color: AppTheme.nearlyWhite2)));
}

Text infoMesssageSmall(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 14,
        // color: AppTheme.grey,
        height: 1.5,
        fontFamily: AppTheme.fontNameWorkSans,
        fontStyle: FontStyle.normal),
  );
}

Text infoMesssageSmallSS(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 13,
        // color: AppTheme.grey,
        fontFamily: AppTheme.fontNameWorkSans,
        fontStyle: FontStyle.normal),
  );
}

Text appTitleGoodTimes(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppTheme.fontGoodTimes,
        //fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: 0.5,
        // color: AppTheme.darkText
      ));
}

Text titleNameWorkSansPrimary(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: AppTheme.fontNameWorkSans,
          fontWeight: FontWeight.w700,
          fontSize: 25,
          letterSpacing: 0.5,
          color: AppTheme.primaryRed));
}

Text titleNameWorkSansOrder(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: AppTheme.fontNameWorkSans,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          letterSpacing: 1,
          color: AppTheme.dark_grey));
}

Text totalPriceNameWorkSansPrimary(String text) {
  return Text("Total: " + text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppTheme.fontNameWorkSans,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        letterSpacing: 1,
        // color: AppTheme.dark_grey
      ));
}

Widget bottomBar(Function func) {
  return Column(
    children: <Widget>[
      const Expanded(
        child: SizedBox(),
      ),
      BottomBarView(func: func),
    ],
  );
}

// changeScreen(dynamic model) {
//   animationController.reverse().then<dynamic>((data) {
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       tabBody = model;
//     });
//   });
// }

bool isKeyboardVisible(BuildContext context) {
  return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
}
