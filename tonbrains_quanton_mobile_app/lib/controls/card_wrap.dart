import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

Container customCardWrap(BuildContext context, {Widget child}) {
  return Container(
      decoration: customCardBoxDecoration(),
      margin: defaultMarginCard(),
      padding: defaultPaddingCard(),
      width: MediaQuery.of(context).size.width,
      child: child);
}

EdgeInsetsGeometry defaultPaddingCard() {
  return EdgeInsets.fromLTRB(10, 15, 10, 15);
}

EdgeInsetsGeometry defaultMarginCard() {
  return EdgeInsets.fromLTRB(0, 6, 0, 6);
}

SizedBox cardRowScpaceLong() {
  return SizedBox(
    height: 16,
  );
}

Padding linkPadding(Widget child) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      child: child);
}

Decoration customCardBoxDecoration() {
  return new BoxDecoration(
    color: darkTheme ? AppDarkTheme.lightdark : AppTheme.nearlyWhite,
    boxShadow: boxShadowDecorationList(),
    borderRadius: BorderRadius.circular(8.0),
  );
}

List<BoxShadow> boxShadowDecorationList() {
  return [
    BoxShadow(
        color: (darkTheme ? AppDarkTheme.dark : AppTheme.grey).withOpacity(0.6),
        offset: const Offset(4, 4),
        blurRadius: 8.0)
  ];
}

Row cardItemRow(String name, String value) {
  return cardItemRowWidget(
    name,
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.bold,
          color: AppTheme.darkText,
        ),
      ),
    ),
  );
}

Row cardItemRow2(String name, String value) {
  return cardItemRowWidget2(
    name,
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 9.5,
          fontFamily: AppTheme.fontGoodTimes,
          letterSpacing: 2,
          fontWeight: FontWeight.normal,
          color: appTheme.currentTheme() == ThemeMode.dark
              ? AppDarkTheme.white
              : AppTheme.brandGrey,
        ),
      ),
    ),
  );
}

Row cardItemRowSingle_boollycomment(String value) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
            fontSize: 9.5,
            fontStyle: FontStyle.italic,
            color: AppTheme.grey,
            fontFamily: AppTheme.fontGoodTimes),
      ),
    ),
  );
}

Row cardItemRowSingle_boollycomment_normal(String value,
    [Color color = AppTheme.darkText]) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 9.5,
          fontStyle: FontStyle.italic,
          color: color,
        ),
      ),
    ),
  );
}

Row cardItemRowSingle_price(String value, [Color color = AppTheme.darkText]) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontFamily: AppTheme.fontNameWorkSans,
          fontStyle: FontStyle.normal,
          color: color,
        ),
      ),
    ),
  );
}

SizedBox cardColumnRowScpace() {
  return SizedBox(
    height: 3,
  );
}

Widget itemProperty(String translate, String value, {Widget child}) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardBodyText(translate),
          cardColumnRowScpace(),
          if (child == null) cardBodyTextBold(dashIfNull(value)) else child
        ],
      ),
    ),
  ]);
}

Widget itemPropertySM(String translate, String value, {Widget child}) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardBodyTextSM(translate),
          cardColumnRowScpace(),
          if (child == null) cardBodyTextBoldSM(dashIfNull(value)) else child
        ],
      ),
    ),
  ]);
}

Text cardBodyTextBold(String value, [Color color = AppTheme.darkText]) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Text cardBodyTextBoldSM(String value, [Color color = AppTheme.darkText]) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: appTheme.currentTheme() == ThemeMode.dark
          ? AppTheme.white
          : AppTheme.darkText,
    ),
  );
}

bool isNullEmptyOrFalse(Object o) => o == null || false == o || "" == o;
String dashIfNull(String value) {
  if (isNullEmptyOrFalse(value)) {
    return value = "-";
  }

  return value;
}

Row cardItemRowSingle_pricewithDiscount(String value, String original) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            original,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              fontFamily: AppTheme.fontNameWorkSans,
              decoration: TextDecoration.lineThrough,
              // color: AppTheme.grey,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: AppTheme.fontNameWorkSans,
              fontStyle: FontStyle.normal,
              color: AppTheme.primaryRed,
            ),
          ),
        ],
      ),
    ),
  );
}

Row cardItemRowSingleBoollycommentLlink(String value,
    [Color color = AppTheme.blue]) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.bold,
          //fontStyle: FontStyle.italic,
          color: color,
        ),
      ),
    ),
  );
}

Row cardItemRowSingle(String value, [Color color = AppTheme.darkText]) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 14.5,
          height: 1.3,
          //fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ),
  );
}

Row cardItemRowSingle_Normal(String value, [Color color = AppTheme.darkText]) {
  return cardItemRowWidgetSingle(
    Expanded(
      child: Text(
        value,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 11.5,
          height: 1.3,
          //fontStyle: FontStyle.italic,
          // color: color,
        ),
      ),
    ),
  );
}

Row cardItemRowWidgetSingle(Widget widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      widget,
    ],
  );
}

Row cardItemRowWidget(String name, Widget widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      cardBodyText(name),
      widget,
    ],
  );
}

Row cardItemRowWidget2(String name, Widget widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      titleGoodTimesSM(
          name,
          appTheme.currentTheme() == ThemeMode.dark
              ? AppDarkTheme.blue
              : AppTheme.darkText),
      widget,
    ],
  );
}

Text cardBodyText(String value, [Color color = AppTheme.darkText]) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}

Text cardBodyTextSM(String value, [Color color = AppTheme.darkText]) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: appTheme.currentTheme() == ThemeMode.dark
          ? AppTheme.white
          : AppTheme.darkText,
    ),
  );
}

Text cardtitle(String value, [Color color = AppTheme.primaryRed]) {
  return Text(value,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: 18,
      ));
}

SizedBox cardRowScpace() {
  return SizedBox(
    height: 8,
  );
}

Text cardtitleCenter(String value, [Color color = AppTheme.primaryRed]) {
  return Text(value,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0.5,
        fontSize: 18,
      ));
}

Container cardtitleRight(String value, [Color color = AppTheme.brandGrey]) {
  return Container(
    alignment: Alignment.centerRight,
    child: Text(value,
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 0.5,
          fontSize: 14,
        )),
  );
}

Container cardDateRight(String value, [Color color = AppTheme.brandGrey]) {
  return Container(
    alignment: Alignment.centerRight,
    child: Text(value,
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: AppTheme.fontGoodTimes,
          color: color,
          letterSpacing: 0.5,
          fontSize: 10,
        )),
  );
}

Text cardtitleGoodTimes(String value, [Color color = AppTheme.primaryRed]) {
  return Text(value,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 2,
          fontSize: 14,
          fontFamily: AppTheme.fontGoodTimes));
}

Text cardtitleGoodTimesSM(String value, [Color color = AppTheme.primaryRed]) {
  return Text(value,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 1.5,
          fontSize: 12,
          fontFamily: AppTheme.fontGoodTimes));
}
