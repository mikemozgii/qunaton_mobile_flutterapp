import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/enter_token.dart';
import 'package:tonbrains_quanton_mobile_app/pages/transfer_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';

class DeActionsScreen extends StatefulWidget {
  DeActionsScreen({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _DeActionsScreenState createState() => _DeActionsScreenState();
}

class _DeActionsScreenState extends State<DeActionsScreen>
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
    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Actions"));
    listViews.add(SizedBox(height: 10));
    listViews.add(infoMesssageSmall(
        "Actions are designed to create asynchronous operations to QUANTCHAIN. Simply, submit an action. You can select as many actions as you like. QUANTCHAIN will process them as soon as possible."));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "QUANTCHAIN is the real-time blockchain decentralized engine."));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Each QUANTCHAIN block is released every 5 seconds or less. When the Action completes the execution you will receive a 'Certificate of Proof'. The certificate can be used to verify a transaction state."));
    listViews.add(SizedBox(height: 40));

    listViews.add(appTitleGoodTimes("Let's Start"));

    listViews.add(SizedBox(height: 20));
    listViews.add(
      RaisedButton.icon(
        label: Text("Trasnfer QUANNIES"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransferScreen()),
          )
        },
        icon: Icon(
          FontAwesomeIcons.solidPaperPlane,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );

    listViews.add(
      RaisedButton.icon(
        label: Text("Enter Transfer Token"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnterTokenScreen()),
          )
        },
        icon: Icon(
          FontAwesomeIcons.fingerprint,
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
