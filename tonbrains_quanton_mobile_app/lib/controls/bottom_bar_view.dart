import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/bounce_widget.dart';
import 'package:tonbrains_quanton_mobile_app/controls/tabIcon_data.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/deactions_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/deapps_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/destore_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/transfer_page.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key key, this.func}) : super(key: key);
  final Function func;
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<TabIconData> tabIconsList;

  @override
  void initState() {
    tabIconsList = <TabIconData>[
      TabIconData(
          icon: FontAwesomeIcons.solidPaperPlane,
          title: "Send",
          animationController: null,
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransferScreen()),
                )
              }),
      TabIconData(
          icon: FontAwesomeIcons.compress,
          title: "Actions",
          animationController: null,
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeActionsScreen()),
                )
              }),
      TabIconData(
          icon: FontAwesomeIcons.barcode,
          title: "Store",
          animationController: null,
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeStoreScreen()),
                )
              }),
      TabIconData(
          icon: FontAwesomeIcons.hive,
          title: "Apps",
          animationController: null,
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeAppsScreen()),
                )
              }),
    ];
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color:
                    darkTheme ? AppDarkTheme.lightdark : AppTheme.nearlyWhite,
                elevation: 16.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                                parent: animationController,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        38.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TabIcons(tabIconData: tabIconsList[0]),
                            ),
                            Expanded(
                              child: TabIcons(tabIconData: tabIconsList[1]),
                            ),
                            SizedBox(
                              width: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animationController,
                                          curve: Curves.fastOutSlowIn))
                                      .value *
                                  64.0,
                            ),
                            Expanded(
                              child: TabIcons(tabIconData: tabIconsList[2]),
                            ),
                            Expanded(
                              child: TabIcons(tabIconData: tabIconsList[3]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController,
                            curve: Curves.fastOutSlowIn)),
                    child: BouncingWidget(
                      duration: Duration(milliseconds: 150),
                      scaleFactor: 2.5,
                      child: Container(
                        // alignment: Alignment.center,s
                        decoration: BoxDecoration(
                          // color: AppTheme.nearlyWhite,
                          gradient: LinearGradient(
                              colors: [
                                AppTheme.primaryRed,
                                AppTheme.primaryRed.withOpacity(1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: AppTheme.primaryRed.withOpacity(0.1),
                                offset: const Offset(2.0, 4.0),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            // splashColor: Colors.white.withOpacity(0.9),
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            // onTap: () {
                            //   // widget.addClick();
                            //   // removeAllSelection();
                            // },
                            child: Padding(
                              padding: const EdgeInsets.all(5.5),
                              child:
                                  Image.asset("assets/img/qunatum_chip2.png"),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (widget.func != null) widget.func();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// child: InkWell(
//                           splashColor: Colors.white.withOpacity(0.9),
//                           highlightColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           onTap: () {
//                             widget.addClick();
//                             removeAllSelection();
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(11.5),
//                             child: Image.asset("assets/img/quanet_matrix_white.png"),
//                           ),
//                         ),

  // void setRemoveAllSelection(TabIconData tabIconData) {
  //   if (!mounted) return;
  //   setState(() {
  //     widget.tabIconsList.forEach((TabIconData tab) {
  //       tab.isSelected = false;
  //       if (tabIconData.index == tab.index) {
  //         tab.isSelected = true;
  //       }
  //     });
  //   });
  // }

  // void removeAllSelection() {
  //   if (!mounted) return;
  //   setState(() {
  //     widget.tabIconsList.forEach((TabIconData tab) {
  //       tab.isSelected = false;
  //     });
  //   });
  // }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key key, this.tabIconData}) : super(key: key);

  final TabIconData tabIconData;
  //final Function removeAllSelect;
  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  // AnimationController animationController;
  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 400),
    // );

    widget.tabIconData.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          // widget.removeAllSelect();

          widget.tabIconData.animationController.reverse();
          widget.tabIconData.onTap();
        }
      });
  }

  void setAnimation() {
    widget.tabIconData.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SpringButton(
      SpringButtonType.WithOpacity,
      Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 3),
              Container(
                alignment: Alignment.center,
                child: Icon(widget.tabIconData.icon,
                    size: 26,
                    color: darkTheme ? AppDarkTheme.blue : AppTheme.grey),
              ),
              SizedBox(height: 9),
              Text(widget.tabIconData.title,
                  style: TextStyle(
                      color:
                          darkTheme ? AppDarkTheme.white : AppTheme.dark_grey,
                      fontFamily: "goodtimes",
                      fontSize: 10.5)),
            ],
          ),
        ],
      ),
      onTap: () {
        widget.tabIconData.onTap();
      },
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
