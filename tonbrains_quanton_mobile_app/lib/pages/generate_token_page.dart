import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:fixnum/fixnum.dart';
import 'package:tonbrains_quanton_mobile_app/controls/helper_functions.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/validators.dart';
import 'package:tonbrains_quanton_mobile_app/pages/deaction_created.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GenerateTokenScreen extends StatefulWidget {
  final String mode;
  final String contact;

  GenerateTokenScreen({Key key, this.mode, this.contact}) : super(key: key);

  @override
  _GenerateTokenScreenState createState() => _GenerateTokenScreenState();
}

class _GenerateTokenScreenState extends State<GenerateTokenScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Animation<double> topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;

  AnimationController animationBalanceController;
  Animation<int> animationBalance;

  var busy = false;
  var loaded = false;
  Int64 balance;
  String amount = "";
  String phone = "";
  String email = "";

  final maskFormatter = new MaskTextInputFormatter(
      mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    if (widget.contact != null && widget.mode == 'email')
      email = widget.contact;
    if (widget.contact != null && widget.mode == 'phone')
      phone = widget.contact;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    topBarAnimation = getTopBarAnimation(animationController);
    getData();
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
    animationBalanceController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = GetBalanceRequest();

      final result =
          await client.getBalance(request, options: apiOptions(options));

      animationBalanceController = new AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );

      setState(() {
        balance = result.balance;
        loaded = true;
        animationBalance = new StepTween(begin: 0, end: result.balance.toInt())
            .animate(new CurvedAnimation(
                parent: animationBalanceController, curve: Curves.easeIn));
      });
      animationBalanceController.forward();
    }, withLogs: false);

    return true;
  }

  Future<bool> showLoader() async {
    await Future.delayed(Duration(milliseconds: 750));
    return Future.value(loaded);
  }

  @override
  Widget build(BuildContext context) {
    var listViews = new List<Widget>();

    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Generate Encrypted Token"));
    listViews.add(SizedBox(height: 20));
    listViews.add(Icon(
      FontAwesomeIcons.fingerprint,
      size: 64,
      color: AppTheme.primaryRed,
    ));
    listViews.add(SizedBox(height: 20));
    listViews.add(infoMesssage(
        "Enter the required information to build a 'Transaction Token'. The token can be shared with anyone. "));
    listViews.add(SizedBox(height: 10));
    listViews.add(infoMesssage(
        "The receiver needs to 'Use Token' to complete the transaction."));
    listViews.add(SizedBox(height: 10));
    listViews.add(
        infoMesssage("The transaction cannot be recovered after completion."));
    listViews.add(SizedBox(height: 20));
    if (widget.mode == "email" && widget.contact == null) {
      listViews.add(SizedBox(height: 20));
      listViews.add(
        TextFormField(
          initialValue: email,
          keyboardType: TextInputType.text,
          onChanged: (value) => setState(() {
            email = value;
          }),
          validator: (value) => emailValidate(value, required: true),
          decoration: textFieldDecoration("Email"),
        ),
      );
    }
    if (widget.mode == "phone" && widget.contact == null) {
      listViews.add(SizedBox(height: 20));
      listViews.add(
        TextFormField(
          inputFormatters: [maskFormatter],
          initialValue: phone,
          keyboardType: TextInputType.number,
          onChanged: (value) => setState(() {
            phone = value;
          }),
          validator: (value) => textValidate(value),
          decoration: textFieldDecoration("Phone"),
        ),
      );
    }
    listViews.add(SizedBox(height: 20));
    listViews.add(
      TextFormField(
        initialValue: amount,
        keyboardType: TextInputType.number,
        onChanged: (value) => setState(() {
          amount = value;
        }),
        validator: (value) =>
            numberValidate(value, required: true, maxValue: balance),
        decoration: textFieldDecoration("Amount"),
      ),
    );
    listViews.add(SizedBox(height: 30));
    listViews.add(Row(
      children: [
        titleNameWorkSansMd(
            "Available Balance: ",
            appTheme.currentTheme() == ThemeMode.dark
                ? AppTheme.white
                : AppTheme.grey),
        if (animationBalance != null)
          AnimatedBuilder(
            animation: animationBalance,
            builder: (BuildContext context, Widget child) {
              var balance = animationBalance.value.toString() + " " + qo;
              return titleGoodTimesMd(
                  balance,
                  appTheme.currentTheme() == ThemeMode.dark
                      ? AppDarkTheme.blue
                      : AppTheme.grey);
            },
          ),
      ],
    ));
    listViews.add(SizedBox(height: 20));
    listViews.add(Row(
      children: [
        titleNameWorkSansSM(
            "Action Fee: ",
            appTheme.currentTheme() == ThemeMode.dark
                ? AppTheme.white
                : AppTheme.grey),
        if (animationBalance != null)
          AnimatedBuilder(
            animation: animationBalance,
            builder: (BuildContext context, Widget child) {
              var balance = 1.toString() + " " + qo;
              return titleNameWorkSansSM(
                  balance,
                  appTheme.currentTheme() == ThemeMode.dark
                      ? AppDarkTheme.blue
                      : AppTheme.grey);
            },
          ),
      ],
    ));
    listViews.add(SizedBox(height: 10));
    listViews.add(Padding(
      padding: const EdgeInsets.only(left: 4),
      child: infoMesssageSuperSmallLeft(deActionFeeDesc),
    ));
    listViews.add(SizedBox(height: 20));
    listViews.add(
      RaisedButton.icon(
        label: getButtonText(widget.mode),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => generateToken(),
        icon: Icon(
          getButtonIcon(widget.mode),
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
              return showLoader();
            }, animationController, scrollController, listViews,
                showlaoding: !loaded));
  }

  Text getButtonText(String mode) {
    var text = "Generate";

    switch (mode) {
      case 'email':
        text = "Send Email";
        break;
      case 'phone':
        text = "Send by Sms";
        break;
    }

    return Text(text);
  }

  IconData getButtonIcon(String mode) {
    var icon = FontAwesomeIcons.fingerprint;

    switch (mode) {
      case 'email':
        return FontAwesomeIcons.solidEnvelope;
        break;
      case 'phone':
        return FontAwesomeIcons.solidCommentAltLines;
        break;
    }

    return icon;
  }

  Future generateToken() async {
    if (!formKey.currentState.validate() || busy) return;
    setState(() {
      busy = true;
    });

    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = TransferBalanceRequest()
        ..amount = Int64.parseInt(amount)
        ..email = email
        ..phone = phone;
      amount = null;

      final result =
          await client.transferBalance(request, options: apiOptions(options));
      busy = false;

      if (result.token.isNotEmpty) {
        if (widget.mode == "email") {
          var message = shareMessageText
              .replaceAll(RegExp(r'AAAAAAAA'), result.token)
              .replaceAll(RegExp(r'{newline}'), '<br /><br />');
          message += '<br /><br />';
          message += shareMessageLink;

          final MailOptions mailOptions = MailOptions(
              body: message,
              subject: shareMessageTitle,
              recipients: <String>[email],
              isHTML: true);

          await FlutterMailer.send(mailOptions);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          return;
        }

        if (widget.mode == "phone") {
          var message = shareMessageText
              .replaceAll(RegExp(r'AAAAAAAA'), result.token)
              .replaceAll(RegExp(r'{newline}'), '\n\n');
          message += '\n\n';
          message += shareMessageLink;

          await sendSMS(message: message, recipients: [phone]);
          await Future.delayed(Duration(milliseconds: 1000));

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DeactionCreatedScreen(result.token)),
        );
      } else {
        setState(() {});
      }
    });
  }
}
