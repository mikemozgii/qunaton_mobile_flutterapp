import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class QuantchaintbScreen extends StatefulWidget {
  QuantchaintbScreen({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _QuantchaintbScreenState createState() => _QuantchaintbScreenState();
}

class _QuantchaintbScreenState extends State<QuantchaintbScreen>
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

    listViews.add(SizedBox(height: 25));
    listViews.add(
      Icon(
        FontAwesomeIcons.solidDiceD10,
        size: 54,
        color: AppTheme.primaryRed,
      ),
    );

    listViews.add(SizedBox(height: 35));

    listViews.add(infoMesssageSmallSS(
        "This is a base QUANTCHAIN provided by TON BRAINS. Users can install a variety of Apps. "));

    listViews.add(SizedBox(height: 15));
    listViews.add(infoMesssageSmallSS(
        "Users are required to manage their balance in the positive stage to keep their accounts active."));

    listViews.add(SizedBox(height: 15));
    listViews.add(infoMesssageSmallSS(
        "Early Access Program (EAP) is designed to benefit early adopters with valuable prizes. Please visit TON BRAINS (tonbrains.com) for more details. "));

    listViews.add(SizedBox(height: 15));
    listViews.add(infoMesssageSmallSS(
        "Base QUANTCHAINs are designed to execute day-to-day operations such as communications, shopping, and others. Visit Store for desirable Apps. "));

    listViews.add(SizedBox(height: 15));
    listViews.add(infoMesssageSmallSS(
        "All Apps are using QUANNIES (crypto resources) to operate in QUANTCHAIN. You can always purchase QUANNIES in Store or earn them by using Apps. "));

    listViews.add(SizedBox(height: 15));
    listViews.add(infoMesssageSmallSS(
        "QUANTCHIANs burn crypto resources the same as a car is using gas to move. Keep in mind crypto resources are not a traditional cryptocurrency. QUANTCHAINs are issuing crypto resources based on usage. The more operations executed on QUANTCHAINs the more crypto resource will be released for users to purchase. "));

    listViews.add(SizedBox(height: 15));
    listViews.add(infoMesssageSmallSS(
        "The price of crypto resources is based on QUANTCHAINs and their popularity. We suggest purchasing as many resources as you can to avoid inflation. Each QUANTCHAIN has it’s own crypto resource. "));

    // listViews.add(SizedBox(height: 20));
    // listViews.add(infoMesssageSmall(
    //     "Each Quantchaintb is optimized to its behavior and can be infinitely expanded to serve all user’s needs."));

    listViews.add(SizedBox(height: 20));
    listViews.add(RaisedButton.icon(
      label: Text("Dashboard"),
      // color: AppTheme.white,
      // textColor: AppTheme.primaryRed,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
      icon: Icon(
        FontAwesomeIcons.braille,
        // color: AppTheme.primaryRed,
        size: 12,
      ),
    ));

    listViews.add(
      RaisedButton.icon(
        label: Text("QUANTCHAIN EXPLORER"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          const url = "https://tonbrains.com/quantchain-explorer/last";
          if (await canLaunch(url)) await launch(url);
        },
        icon: Icon(
          FontAwesomeIcons.solidCubes,
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
