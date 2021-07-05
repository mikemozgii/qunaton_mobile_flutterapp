import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/controls/helper_functions.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/validators.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:tonbrains_quanton_mobile_app/services/auth_svc.dart';

class MnemonicPhraseSignInPage extends StatefulWidget {
  final String mode;

  MnemonicPhraseSignInPage({Key key, this.mode}) : super(key: key);

  @override
  _MnemonicPhraseSignInPageState createState() =>
      _MnemonicPhraseSignInPageState();
}

class _MnemonicPhraseSignInPageState extends State<MnemonicPhraseSignInPage>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Animation<double> topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  final phrasesCount = 5;
  String phrase = "";
  bool busy = false;

  Future<bool> showLoader() async {
    await Future.delayed(Duration(milliseconds: 250));
    return true;
  }

  @override
  void initState() {
    phrase = "";
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

  @override
  Widget build(BuildContext context) {
    var listViews = new List<Widget>();
    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Phrase Sign in"));
    listViews.add(SizedBox(height: 30));
    listViews.add(Icon(
      FontAwesomeIcons.list,
      size: 64,
      color: AppTheme.primaryRed,
    ));
    listViews.add(SizedBox(height: 35));
    listViews.add(infoMesssageSmall(
        "Please enter 'Mnemonic phrase' 12 words to login. If the Phrase is not present in qunatchain, the new user account will be registered."));
    listViews.add(SizedBox(height: 20));
    listViews.add(
      TextFormField(
        keyboardType: TextInputType.text,
        minLines: 3,
        maxLines: 5,
        validator: (value) => textValidate(value),
        onChanged: (value) => setState(() {
          phrase = value;
        }),
        decoration: textFieldDecoration("Enter 12 words"),
      ),
    );

    listViews.add(SizedBox(height: 30));

    listViews.add(
      RaisedButton.icon(
        label: Text("Sign in"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => signIn(),
        icon: Icon(
          FontAwesomeIcons.list,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    listViews = toAnimatedWidgets(listViews, animationController);

    return busy
        ? getLoadingWidget("long")
        : Form(
            key: formKey,
            child: getMainContainer(context, () {
              return showLoader();
            }, animationController, scrollController, listViews));
  }

  Future signIn() async {
    if (!formKey.currentState.validate()) return;

    setState(() {
      busy = true;
    });

    await Provider.of<AuthService>(context, listen: false)
        .signInWitPhrase(phrase);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }
}
