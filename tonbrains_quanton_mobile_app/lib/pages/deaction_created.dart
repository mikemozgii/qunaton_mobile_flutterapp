import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:flutter/services.dart';

class DeactionCreatedScreen extends StatefulWidget {
  final String token;

  DeactionCreatedScreen(this.token, {Key key}) : super(key: key);

  @override
  _DeactionCreatedScreenState createState() => _DeactionCreatedScreenState();
}

class _DeactionCreatedScreenState extends State<DeactionCreatedScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Animation<double> topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;

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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var listViews = new List<Widget>();
    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Action"));
    listViews.add(SizedBox(height: 20));
    listViews.add(Center(
        child: Icon(
      FontAwesomeIcons.compress,
      size: 64,
      color: AppTheme.primaryRed,
    )));
    listViews.add(SizedBox(height: 30));
    listViews.add(titleGoodTimesMd("Generated Encrypted Token"));
    listViews.add(SizedBox(height: 10));
    listViews.add(infoMesssageSmall("Has been completed"));
    listViews.add(SizedBox(height: 20));
    listViews.add(Center(child: titleNameWorkSansXS(widget.token)));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "Please share the generated token with a reciever to complete the transaction. Please use the ‘Matrix’ dashboard to stop or cancel the transaction."));

    listViews.add(SizedBox(height: 30));
    listViews.add(
      RaisedButton.icon(
        label: Text("Copy"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {
          scaffoldKey.currentState.removeCurrentSnackBar();
          scaffoldKey.currentState.showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Copied to clipboard'),
          ));
          Clipboard.setData(new ClipboardData(text: widget.token));
        },
        icon: Icon(
          FontAwesomeIcons.solidCopy,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    //listViews.add(SizedBox(height: 10));
    listViews.add(
      RaisedButton.icon(
        label: Text("Share"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          var text = shareMessageText
              .replaceAll(RegExp(r'AAAAAAAA'), widget.token)
              .replaceAll(RegExp(r'{newline}'), '       ');
          await FlutterShare.share(
              title: shareMessageTitle, text: text, linkUrl: shareMessageLink);
        },
        icon: Icon(
          FontAwesomeIcons.solidShareAlt,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    // listViews.add(SizedBox(height: 10));
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
    }, animationController, scrollController, listViews,
        scaffoldKey: scaffoldKey);
  }
}
