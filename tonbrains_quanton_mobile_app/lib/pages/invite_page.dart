import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

class InviteScreen extends StatefulWidget {
  InviteScreen({Key key}) : super(key: key);

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;

  final RegExp numeric = RegExp(r'^[0-9]+$');

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    topBarAnimation = getTopBarAnimation(animationController);

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

  Future<bool> getData() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    listViews = new List<Widget>();
    // listViews.add(SizedBox(height: 10));
    // listViews.add(appTitleGoodTimes("Referral Program"));
    // listViews.add(SizedBox(height: 20));
    // listViews.add(infoMesssageSmall(
    //     "How would you rate ‘QUANTON’ app? If positive, please send your friendly invite to your friends, family members, and co-workers to share the awesome experience."));
    // listViews.add(SizedBox(height: 10));
    // listViews.add(infoMesssageSmall(
    //     "Both of you will get a 100 T bonus upon successful sign-up."));
    // listViews.add(SizedBox(height: 40));
    // listViews.add(
    //   RaisedButton.icon(
    //     label: Text("Share Now"),
    //     // color: AppTheme.white,
    //     // textColor: AppTheme.primaryRed,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: new BorderRadius.circular(18.0),
    //     ),
    //     onPressed: () => invite(),
    //     icon: Icon(
    //       FontAwesomeIcons.smile,
    //       // color: AppTheme.primaryRed,
    //       size: 12,
    //     ),
    //   ),
    // );

    listViews.add(Container(
      height: MediaQuery.of(context).size.height - 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.users,
            size: 64,
            color: AppTheme.primaryRed,
          ),
          SizedBox(
            height: 35,
          ),
          appTitleGoodTimes("Referral Program"),
          SizedBox(
            height: 25,
          ),
          infoMesssageSmall(
              "How would you rate ‘QUANTON’ app? If positive, please send your friendly invite to your friends, family members, and co-workers to share the awesome experience."),
          SizedBox(
            height: 20,
          ),
          infoMesssageSmall("Both of you will get a 100 " +
              qo +
              " bonus upon successful sign-up."),
          SizedBox(
            height: 25,
          ),
          RaisedButton.icon(
            label: Text("Share Now"),
            // color: AppTheme.white,
            // textColor: AppTheme.primaryRed,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () => invite(),
            icon: Icon(
              FontAwesomeIcons.smile,
              // color: AppTheme.primaryRed,
              size: 12,
            ),
          ),
        ],
      ),
    ));

    listViews = toAnimatedWidgets(listViews, animationController);

    return getMainContainer(context, () {
      //TODO: add getting available balance
      return getData();
    }, animationController, scrollController, listViews);
  }

  Future invite() async {
    await FlutterShare.share(
        title: shareMessageTitle,
        text: shareMessageText.replaceAll(RegExp(r'{newline}'), '       '),
        linkUrl: shareMessageLink);

    // await prepareApiSession(
    //     (ClientChannel channel, Map<String, String> options) async {
    //   final client = TonMobileClient(channel);
    //   final request = TransferBalanceRequest()
    //     ..transferBalance = transferBalance;
    //   transferBalance = null;

    //   final result =
    //       await client.transferBalance(request, options: apiOptions(options));
    //   if (result.token.isEmpty) return;
    //   print(result.token);

    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomePage()),
    //   );
    // });
  }
}
