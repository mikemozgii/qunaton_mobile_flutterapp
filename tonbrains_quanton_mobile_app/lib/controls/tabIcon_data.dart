import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({this.icon, this.animationController, this.title, this.onTap});
  IconData icon;
  int index;
  String title;
  Function onTap;
  AnimationController animationController;
}
