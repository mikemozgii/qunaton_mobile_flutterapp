import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';

class QuantchainScreen extends StatefulWidget {
  QuantchainScreen({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _QuantchainScreenState createState() => _QuantchainScreenState();
}

class _QuantchainScreenState extends State<QuantchainScreen>
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

    listViews.add(SizedBox(height: 35));
    listViews.add(
      Icon(
        FontAwesomeIcons.chartNetwork,
        size: 64,
        color: AppTheme.primaryRed,
      ),
    );

    listViews.add(SizedBox(height: 35));

    listViews.add(infoMesssageSmall(
        "Using this option you can your favorite QUANTCHAINs. Each QUANTCHAIN has it’s own unique futures and functionalities. Actions and DeApps are different from the default QUANTCHAIN provided by TON BRAINS. "));

    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Using this option you can your favorite QUANTCHAINs. Each QUANTCHAIN has it’s own unique futures and functionalities. Actions and DeApps are different from the default QUANTCHAIN provided by TON BRAINS. "));

    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Several types of QUANTCHAINs specialized in a variety of tasks and algorithms. Some QUANTCHAINs have designed to execute day-to-day tasks where others are can get you in Artificial Intelligence, Neuro Networks, Graphics, Games, etc."));

    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Each QUANTCHAIN is optimized to its behavior and can be infinitely expanded to serve all user’s needs."));

    listViews.add(SizedBox(height: 35));
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

    listViews = toAnimatedWidgets(listViews, animationController);

    return getMainContainer(context, () {
      return getData();
    }, animationController, scrollController, listViews);
  }
}
