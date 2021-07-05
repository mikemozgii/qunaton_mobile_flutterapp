import 'package:flutter/material.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/contacts_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/generate_token_page.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({Key key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with TickerProviderStateMixin {
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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
    listViews.add(appTitleGoodTimes("Transfer QUANNIES"));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "You can transfer QUANNIES to your Friends and Clients by using emails or SMS. QUANTON will generate a code and prepare a message with instructions for the receiver."));
    listViews.add(SizedBox(height: 40));
    listViews.add(
      RaisedButton.icon(
        label: Text("Choose Contact"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsPage()),
          );
        },
        icon: Icon(
          FontAwesomeIcons.solidUsers,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 10));
    listViews.add(
      RaisedButton.icon(
        label: Text("Send by Email"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GenerateTokenScreen(mode: "email")),
          );
        },
        icon: Icon(
          FontAwesomeIcons.solidEnvelope,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 10));
    listViews.add(
      RaisedButton.icon(
        label: Text("Send by Phone"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GenerateTokenScreen(mode: "phone")),
          );
        },
        icon: Icon(
          FontAwesomeIcons.solidPhone,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 60));
    listViews.add(appTitleGoodTimes("Issue Transfer Token"));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssageSmall(
        "You can generate a token and send it using alternate options."));
    listViews.add(SizedBox(height: 40));
    listViews.add(
      RaisedButton.icon(
        label: Text("Issue Transfer Token"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GenerateTokenScreen()),
          );
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
