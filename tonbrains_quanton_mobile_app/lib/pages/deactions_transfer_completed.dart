import 'package:flutter/material.dart';

import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';

import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';

import 'package:tonbrains_quanton_mobile_app/pages/enter_token.dart';
import 'package:tonbrains_quanton_mobile_app/pages/transfer_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';

import '../globals.dart';
import 'home_page.dart';

class DeActionTransferCompletedScreen extends StatefulWidget {
  final TransferLogs deaction;
  final String deactionMode;
  DeActionTransferCompletedScreen({Key key, this.deaction, this.deactionMode})
      : super(key: key);

  @override
  _DeActionTransferCompletedScreenState createState() =>
      _DeActionTransferCompletedScreenState();
}

class _DeActionTransferCompletedScreenState
    extends State<DeActionTransferCompletedScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;
  TransferLogs curretnDeaction;
  String currentDeactionMode;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    topBarAnimation = getTopBarAnimation(animationController);
    //addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    curretnDeaction = this.widget.deaction;
    currentDeactionMode = this.widget.deactionMode;
    super.initState();
  }

  void addAllListData() {}

  Future<bool> getData() async {
    // keys = await selectAllSeedPhrase();
    // await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  // ,

  @override
  Widget build(BuildContext context) {
    listViews = new List<Widget>();
    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Action"));
    listViews.add(SizedBox(height: 30));
    listViews.add(Center(
        child: Icon(
      FontAwesomeIcons.compress,
      size: 64,
      color: AppTheme.primaryRed,
    )));
    listViews.add(SizedBox(height: 35));

    if (currentDeactionMode == "pause") {
      listViews.add(titleGoodTimesMd("Pause Transfer"));
      listViews.add(SizedBox(height: 10));
      listViews.add(infoMesssageSmall("Has been completed"));
    } else if (currentDeactionMode == "delete") {
      listViews.add(titleGoodTimesMd("Delete Transfer"));

      listViews.add(SizedBox(height: 10));
      listViews.add(infoMesssageSmall("Has been completed"));
    } else if (currentDeactionMode == "resume") {
      listViews.add(titleGoodTimesMd("Resume Transfer"));

      listViews.add(SizedBox(height: 10));
      listViews.add(infoMesssageSmall("Has been completed"));
    }
    listViews.add(SizedBox(height: 30));
    listViews.add(
      RaisedButton.icon(
        label: Text("Dashboard"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        icon: Icon(
          FontAwesomeIcons.braille,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 40));
    listViews.add(infoMesssageSuperSmall(deactionText1));

    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSuperSmall(deactionText2));
    listViews = toAnimatedWidgets(listViews, animationController);

    return getMainContainer(context, () {
      return getData();
    }, animationController, scrollController, listViews);
  }
}
