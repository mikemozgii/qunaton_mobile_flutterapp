import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EAPScreen extends StatefulWidget {
  EAPScreen({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _EAPScreenState createState() => _EAPScreenState();
}

class _EAPScreenState extends State<EAPScreen> with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;

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
    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Early Access Program"));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Early Access Program (EAP) is designed to test the QUANTON Ecosystem and QUANTCHAINs decentralized networks with a large audience."));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Early adopters will have many benefits by helping TON BRAINS resolve all technical issues and get ready for Global Rocket Launch!"));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Every early adopter will get benefits for using QUANTON Mobile App and inviting friends."));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "We are encouraging all users to join our Community to get even more benefits for participating in EAP."));
    listViews.add(SizedBox(height: 40));

    listViews.add(SizedBox(height: 20));
    listViews.add(
      RaisedButton.icon(
        label: Text("Visit TON BRAINS"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          const url = "https://tonbrains.com";
          if (await canLaunch(url)) await launch(url);
        },
        icon: Icon(
          FontAwesomeIcons.globe,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 10));
    listViews.add(
      RaisedButton.icon(
        label: Text("Join Community"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          const url = "https://discord.com/invite/tN4tsVb";
          if (await canLaunch(url)) await launch(url);
        },
        icon: Icon(
          FontAwesomeIcons.discord,
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

  canLaunch(String url) {}
}
