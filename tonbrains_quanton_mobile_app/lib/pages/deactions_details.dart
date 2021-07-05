import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/card_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/deactionhlp.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';

import '../globals.dart';
import 'deactions_transfer.dart';

class DeActionDetailsScreen extends StatefulWidget {
  final TransferLogs deaction;
  DeActionDetailsScreen({Key key, this.deaction}) : super(key: key);

  @override
  _DeActionDetailsScreenState createState() => _DeActionDetailsScreenState();
}

class _DeActionDetailsScreenState extends State<DeActionDetailsScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;
  TransferLogs curretnDeaction;

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
    listViews.add(appTitleGoodTimes("Action Certificate"));
    listViews.add(SizedBox(height: 15));
    listViews.add(Icon(
      FontAwesomeIcons.fileCertificate,
      size: 54,
      color: AppTheme.primaryRed,
    ));
    listViews.add(SizedBox(height: 30));
    listViews.add(cardItemRow2("Action", "Transfer"));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Amount", curretnDeaction.amount.toString()));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Status", getStatus(curretnDeaction)));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Timestamp", curretnDeaction.time));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Fee", "1 " + qo));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Block", "-"));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Master Block", "-"));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("Transaction", "-"));
    listViews.add(SizedBox(height: 15));
    listViews.add(cardItemRow2("StateStamp", "-"));

    listViews.add(SizedBox(height: 30));

    if (curretnDeaction.status != "Completed") {
      listViews.add(appTitleGoodTimes("Token"));

      listViews.add(SizedBox(height: 15));
      listViews.add(Center(
          child: titleNameWorkSansXS("***********************************")));
      listViews.add(SizedBox(height: 15));
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
            Clipboard.setData(
                new ClipboardData(text: "***********************************"));
          },
          icon: Icon(
            FontAwesomeIcons.solidCopy,
            // color: AppTheme.primaryRed,
            size: 12,
          ),
        ),
      );
      listViews.add(
        RaisedButton.icon(
          label: Text("Share"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () async {
            var text = shareMessageText
                .replaceAll(
                    RegExp(r'AAAAAAAA'), "***********************************")
                .replaceAll(RegExp(r'{newline}'), '       ');
            await FlutterShare.share(
                title: shareMessageTitle,
                text: text,
                linkUrl: shareMessageLink);
          },
          icon: Icon(
            FontAwesomeIcons.solidShareAlt,
            // color: AppTheme.primaryRed,
            size: 12,
          ),
        ),
      );
      listViews.add(SizedBox(height: 25));
      listViews.add(appTitleGoodTimes("ACTIONS"));
    }

    if (curretnDeaction.status == "Paused") {
      listViews.add(SizedBox(height: 10));
      listViews.add(
        RaisedButton.icon(
          label: Text("Resume"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeActionTransferScreen(
                        deaction: curretnDeaction,
                        deactionMode: "resume",
                      )),
            )
          },
          icon: Icon(
            FontAwesomeIcons.solidPlay,
            // color: AppTheme.primaryRed,
            size: 12,
          ),
        ),
      );
    }

    if (curretnDeaction.status == "WaitingForAuthToken") {
      listViews.add(SizedBox(height: 10));
      listViews.add(
        RaisedButton.icon(
          label: Text("PAUSE"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeActionTransferScreen(
                        deaction: curretnDeaction,
                        deactionMode: "pause",
                      )),
            )
          },
          icon: Icon(
            FontAwesomeIcons.solidPause,
            // color: AppTheme.primaryRed,
            size: 12,
          ),
        ),
      );
    }

    if (curretnDeaction.status != "Completed") {
      listViews.add(
        RaisedButton.icon(
          label: Text("DELETE"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeActionTransferScreen(
                        deaction: curretnDeaction,
                        deactionMode: "delete",
                      )),
            )
          },
          icon: Icon(
            FontAwesomeIcons.solidTrash,
            size: 12,
          ),
        ),
      );
    }

    listViews = toAnimatedWidgets(listViews, animationController);

    return getMainContainer(context, () {
      return getData();
    }, animationController, scrollController, listViews);
  }
}
