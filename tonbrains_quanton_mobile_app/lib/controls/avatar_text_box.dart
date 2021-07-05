import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

class AvatarTextBox extends StatefulWidget {
  final String id;
  final double radius;
  final double fontSize;
  final Function onTap;
  final Function onDoubleTap;

  AvatarTextBox(this.id, this.radius,
      {Key key, this.onTap, this.onDoubleTap, this.fontSize = 20});

  @override
  State<StatefulWidget> createState() => AvatarTextBoxState();
}

class AvatarTextBoxState extends State<AvatarTextBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.onTap != null) widget.onTap();
        },
        onDoubleTap: () {
          if (widget.onDoubleTap != null) widget.onDoubleTap();
        },
        child: Container(
          width: widget.radius * 2,
          height: widget.radius * 2,
          decoration: new BoxDecoration(
            color: darkTheme ? AppDarkTheme.white : AppTheme.white,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(widget.id.toUpperCase(),
                  style: TextStyle(
                      color:
                          darkTheme ? AppTheme.primaryRed : AppTheme.primaryRed,
                      fontFamily: AppTheme.fontGoodTimes,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.fontSize))),
        ));
  }
}
