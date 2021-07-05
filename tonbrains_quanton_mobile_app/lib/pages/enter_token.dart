import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/controls/helper_functions.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/validators.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';

class EnterTokenScreen extends StatefulWidget {
  final String mode;

  EnterTokenScreen({Key key, this.mode}) : super(key: key);

  @override
  _EnterTokenScreenState createState() => _EnterTokenScreenState();
}

class _EnterTokenScreenState extends State<EnterTokenScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Animation<double> topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;

  bool busy = false;
  String token = "";

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
    await new Future.delayed(new Duration(milliseconds: 750));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var listViews = new List<Widget>();

    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Enter Token"));
    listViews.add(SizedBox(height: 35));

    listViews.add(Icon(
      FontAwesomeIcons.fingerprint,
      size: 64,
      color: AppTheme.primaryRed,
    ));
    listViews.add(SizedBox(height: 35));

    listViews.add(
        infoMesssage("Please key in the token to complete the transaction."));
    listViews.add(SizedBox(height: 20));

    listViews.add(infoMesssage(
        "Тokens are encrypted DeActions used to complete or execute а transaction in QUANTCHAINs."));
    listViews.add(SizedBox(height: 35));
    listViews.add(
      TextFormField(
        initialValue: token,
        keyboardType: TextInputType.text,
        onChanged: (value) => setState(() {
          token = value;
        }),
        validator: (value) => textValidate(value),
        decoration: textFieldDecoration("Token"),
      ),
    );
    listViews.add(SizedBox(height: 20));
    listViews.add(
      RaisedButton.icon(
        label: Text("Execute"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => receiveToken(),
        icon: Icon(
          FontAwesomeIcons.solidPlay,
          size: 12,
        ),
      ),
    );
    listViews = toAnimatedWidgets(listViews, animationController);

    return busy
        ? getLoadingWidget()
        : Form(
            key: formKey,
            child: getMainContainer(context, () {
              return getData();
            }, animationController, scrollController, listViews,
                scaffoldKey: scaffoldKey));
  }

  Future receiveToken() async {
    if (!formKey.currentState.validate() || busy) return;

    setState(() {
      busy = true;
    });

    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = ReceiveTokenRequest()..token = token;

      final result =
          await client.receiveToken(request, options: apiOptions(options));

      setState(() {
        busy = false;
      });

      if (!result.ok) {
        await new Future.delayed(new Duration(milliseconds: 750), () {});

        scaffoldKey.currentState.removeCurrentSnackBar();
        scaffoldKey.currentState.showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Failed'),
        ));

        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }
}
