import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/destore_page.dart';

class DeAppsScreen extends StatefulWidget {
  DeAppsScreen({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _DeAppsScreenState createState() => _DeAppsScreenState();
}

class _DeAppsScreenState extends State<DeAppsScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;

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
    super.initState();
  }

  void addAllListData() {}

  Future<bool> getData() async {
    // keys = await selectAllSeedPhrase();
    // await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    listViews = new List<Widget>();

    listViews.add(
      SizedBox(
        height: 25,
      ),
    );
    listViews.add(
      Icon(
        FontAwesomeIcons.hive,
        size: 64,
        color: AppTheme.primaryRed,
      ),
    );
    listViews.add(
      SizedBox(
        height: 35,
      ),
    );
    listViews.add(
      infoMesssageSmall(
          "All Apps must be exchanged for QUANNIES (crypto resource). Crypto resource is not a traditional cryptocurrency. You can compare it to a car burning gas to move."),
    );
    listViews.add(
      SizedBox(
        height: 20,
      ),
    );
    listViews.add(
      infoMesssageSmall(
          "Apps will burn crypto resources to operate and execute Actions. To learn more about Apps, Actions, and Crypto Resources visit TON BRAINS (tonbrians.com)."),
    );
    listViews.add(
      SizedBox(
        height: 20,
      ),
    );
    listViews.add(
      infoMesssageSmall(
          "QUANTCHAIN is a typical blockchain where all traffic and data is encrypted and secured. "),
    );
    listViews.add(
      SizedBox(
        height: 20,
      ),
    );
    // listViews.add(
    //   infoMesssageSmallSS(
    //       "Currently, TON BRAINS is using Telegram Open Network Blockchain (TON)  as the first version of the decentralized networks (QUANTCHAINs). Technical details are available at https://ton.org"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 20,
    //   ),
    // );
    // listViews.add(
    //   infoMesssage("Please visit DeStore to purchase DeApps."),
    // );
    listViews.add(
      SizedBox(
        height: 35,
      ),
    );
    listViews.add(
      RaisedButton.icon(
        label: Text("Visit Store"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeStoreScreen(),
              ));
        },
        icon: Icon(
          FontAwesomeIcons.barcode,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );

    listViews = toAnimatedWidgets(listViews, animationController);

    return getMainContainer(context, () {
      return getData();
    }, animationController, scrollController, listViews);
  }
}
