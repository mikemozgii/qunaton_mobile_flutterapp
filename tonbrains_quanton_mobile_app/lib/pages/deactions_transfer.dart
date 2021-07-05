import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/card_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/deactionhlp.dart';
import 'package:tonbrains_quanton_mobile_app/pages/deactions_transfer_completed.dart';
import 'package:tonbrains_quanton_mobile_app/pages/enter_token.dart';
import 'package:tonbrains_quanton_mobile_app/pages/transfer_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';

import '../globals.dart';

class DeActionTransferScreen extends StatefulWidget {
  final TransferLogs deaction;
  final String deactionMode;
  DeActionTransferScreen({Key key, this.deaction, this.deactionMode})
      : super(key: key);

  @override
  _DeActionTransferScreenState createState() => _DeActionTransferScreenState();
}

class _DeActionTransferScreenState extends State<DeActionTransferScreen>
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
  bool busy = false;
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
    if (currentDeactionMode == "pause") {
      listViews.add(appTitleGoodTimes("Pause Transfer"));
      listViews.add(SizedBox(height: 30));
      listViews.add(Icon(
        FontAwesomeIcons.solidPause,
        size: 64,
        color: AppTheme.primaryRed,
      ));
      listViews.add(SizedBox(height: 35));
      listViews.add(infoMesssage(
          "The Transfer will be paused. The receiver won’t be able to complete the token to complete the transaction."));
      listViews.add(SizedBox(height: 30));
      listViews.add(Row(
        children: [
          titleNameWorkSansSM(
              "Action Fee: ",
              appTheme.currentTheme() == ThemeMode.dark
                  ? AppDarkTheme.white
                  : AppTheme.darkText),
          titleNameWorkSansSM(
              1.toString() + " " + qo,
              appTheme.currentTheme() == ThemeMode.dark
                  ? AppDarkTheme.blue
                  : AppTheme.grey)
        ],
      ));
      listViews.add(SizedBox(height: 30));

      //   onTap: () => setTransferStatus(
      //       e,
      //       e.status == 'Paused'
      //           ? 'WaitingForAuthToken'
      //           : 'Paused'),
      // ),

      listViews.add(
        RaisedButton.icon(
          label: Text("PAUSE"),
          // color: AppTheme.white,
          // textColor: AppTheme.primaryRed,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () async {
            setState(() {
              busy = true;
            });
            await setTransferStatushlp(curretnDeaction, 'Paused');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeActionTransferCompletedScreen(
                        deaction: curretnDeaction,
                        deactionMode: "pause",
                      )),
            );
          },
          icon: Icon(
            FontAwesomeIcons.solidPause,
            // color: AppTheme.primaryRed,
            size: 12,
          ),
        ),
      );
    } else if (currentDeactionMode == "delete") {
      listViews.add(appTitleGoodTimes("Delete Transfer"));
      listViews.add(SizedBox(height: 30));
      listViews.add(Icon(
        FontAwesomeIcons.solidTrash,
        size: 64,
        color: AppTheme.primaryRed,
      ));
      listViews.add(SizedBox(height: 35));
      listViews.add(infoMesssage(
          "The Transfer will be deleted. The state of the transaction will be removed. The receiver won’t be able to use the token."));
      listViews.add(SizedBox(height: 30));
      listViews.add(Row(
        children: [
          titleNameWorkSansSM(
              "Action Fee: ",
              appTheme.currentTheme() == ThemeMode.dark
                  ? AppDarkTheme.white
                  : AppTheme.darkText),
          titleNameWorkSansSM(
              1.toString() + " " + qo,
              appTheme.currentTheme() == ThemeMode.dark
                  ? AppDarkTheme.blue
                  : AppTheme.grey)
        ],
      ));
      listViews.add(SizedBox(height: 30));
      listViews.add(
        RaisedButton.icon(
          label: Text("DELETE"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () async {
            setState(() {
              busy = true;
            });
            await setTransferStatushlp(curretnDeaction, 'Stop');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeActionTransferCompletedScreen(
                        deaction: curretnDeaction,
                        deactionMode: "delete",
                      )),
            );
          },
          icon: Icon(
            FontAwesomeIcons.solidTrash,
            size: 12,
          ),
        ),
      );
    } else if (currentDeactionMode == "resume") {
      listViews.add(appTitleGoodTimes("Resume Transfer"));
      listViews.add(SizedBox(height: 30));
      listViews.add(Icon(
        FontAwesomeIcons.solidPlay,
        size: 64,
        color: AppTheme.primaryRed,
      ));
      listViews.add(SizedBox(height: 35));
      listViews.add(infoMesssage(
          "The Transfer will be resumed. The receiver can complete the transaction using the Token"));
      listViews.add(SizedBox(height: 30));
      listViews.add(Row(
        children: [
          titleNameWorkSansSM(
              "Action Fee: ",
              appTheme.currentTheme() == ThemeMode.dark
                  ? AppDarkTheme.white
                  : AppTheme.darkText),
          titleNameWorkSansSM(
              1.toString() + " " + qo,
              appTheme.currentTheme() == ThemeMode.dark
                  ? AppDarkTheme.blue
                  : AppTheme.grey)
        ],
      ));
      listViews.add(SizedBox(height: 30));
      listViews.add(
        RaisedButton.icon(
          label: Text("RESUME"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () async {
            setState(() {
              busy = true;
            });
            await setTransferStatushlp(curretnDeaction, 'WaitingForAuthToken');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeActionTransferCompletedScreen(
                        deaction: curretnDeaction,
                        deactionMode: "resume",
                      )),
            );
          },
          icon: Icon(
            FontAwesomeIcons.solidPlay,
            size: 12,
          ),
        ),
      );
    }

    listViews = toAnimatedWidgets(listViews, animationController);

    return busy
        ? getLoadingWidget()
        : getMainContainer(context, () {
            return getData();
          }, animationController, scrollController, listViews);
  }
}
