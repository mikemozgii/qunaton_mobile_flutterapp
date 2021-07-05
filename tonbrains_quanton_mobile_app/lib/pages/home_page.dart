import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/application_drawer.dart';
import 'package:tonbrains_quanton_mobile_app/controls/card_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/deactionhlp.dart';
import 'package:tonbrains_quanton_mobile_app/pages/eap_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/quantchain_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/quantchaintb_copy.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';
import 'package:spring_button/spring_button.dart';
import 'package:fixnum/fixnum.dart';
import 'package:tonbrains_quanton_mobile_app/services/auth_svc.dart';

import 'deactions_details.dart';

class HomePage extends StatefulWidget {
  // final QuanTonUser currentUser;

  // HomePage(this.currentUser);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationMenuController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;
  List<TransferLogs> transferLogs = List<TransferLogs>();

  Int64 balance;
  AnimationController animationBalanceController;
  HashSet<String> expanded = HashSet<String>();
  Animation<int> animationBalance;
  var busy = false;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationMenuController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationMenuController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationMenuController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationMenuController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationMenuController, curve: Curves.easeOut));
    super.initState();
    animationMenuController.addListener(() {
      setState(() {});
    });
    getData();
  }

  @override
  void dispose() {
    animationMenuController.dispose();
    if (animationBalanceController != null)
      animationBalanceController.dispose();
    super.dispose();
  }

  void getData() async {
    setState(() {
      busy = true;
    });
    Provider.of<AuthService>(context, listen: false).validaTeApiVersion();
    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);

      final result = await client.getBalance(GetBalanceRequest(),
          options: apiOptions(options));

      animationBalanceController = new AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );
      setState(() {
        balance = result.balance;
        animationBalance = new StepTween(begin: 0, end: result.balance.toInt())
            .animate(new CurvedAnimation(
                parent: animationBalanceController, curve: Curves.easeIn));
      });
      animationBalanceController.forward();

      final transferLogsResult = await client
          .transferLogs(TransferLogsRequest(), options: apiOptions(options));

      setState(() {
        transferLogs = transferLogsResult.transferLogs;
        busy = false;
      });
    }, withLogs: false);
  }

  Future setTransferStatus(TransferLogs item, String status) async {
    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = SetTransferStatusRequest()
        ..id = item.id
        ..status = status;

      final result =
          await client.setTransferStatus(request, options: apiOptions(options));

      if (result.status.isEmpty) return;
      if (result.status == "Stop") {
        var _transferLogs = transferLogs.where((e) => e.id != item.id);
        transferLogs = List<TransferLogs>();
        transferLogs.addAll(_transferLogs);
      } else {
        item.status = result.status;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // ;
    List<Widget> widgets = List<Widget>();
    List<Widget> widgets1 = List<Widget>();
    widgets1.add(SizedBox(height: 0.0));
    widgets1.add(Container(
      // alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (animationBalance != null)
            AnimatedBuilder(
              animation: animationBalance,
              builder: (BuildContext context, Widget child) {
                return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      animationBalance.value.toString(),
                      style: TextStyle(
                          fontSize: 46,
                          // fontFamily: AppTheme.fontNameWorkSans,
                          // color: AppTheme.nearlyBlack,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ));
              },
            ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 10),
            child: Image(
              image: AssetImage('assets/img/tonbrains2.png'),
              width: 20,
            ),
          ),
        ],
      ),
    ));
    widgets1.add(Container(
      // alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transferLogs.length > 0 ? "ACTIONS" : "",
            style: TextStyle(
              fontFamily: AppTheme.fontGoodTimes,
              fontSize: 12,
              color: AppTheme.brandGrey,
            ),
          ),
          Text(
            "QUANNIES (QNY)",
            style: TextStyle(
              fontFamily: AppTheme.fontGoodTimes,
              fontSize: 12,
              color: AppTheme.brandGrey,
              //fontStyle: FontStyle.italic
            ),
          ),
        ],
      ),
    ));

    if (transferLogs.length > 0) {
      for (var e in transferLogs) {
        if (e.date.isEmpty) {
          widgets.add(
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 15.0, bottom: 8.0),
              child: SpringButton(
                SpringButtonType.WithOpacity,
                customCardWrap(
                  context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardtitleGoodTimesSM("Transfer"),
                      cardRowScpace(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemPropertySM(
                                  "QNY",
                                  e.amount.toString(),
                                ),
                                cardRowScpace(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemPropertySM(
                                  "Status",
                                  getStatus(e),
                                ),
                                cardRowScpace(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemPropertySM(
                                  "Time UTC",
                                  e.time,
                                ),
                                cardRowScpace(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // cardRowScpaceLong(),
                      // Center(
                      //   child: InkWell(
                      //     onTap: () => toggleExpand(e.id),
                      //     child: linkPadding(cardBodyTextBold(
                      //         "View Details", AppTheme.primaryRed)),
                      //   ),
                      // ),
                      // if (expanded.contains(e.id)) titleGoodTimes("privet12313")
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeActionDetailsScreen(
                              deaction: e,
                            )),
                  );
                },
              ),
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => EAPScreen()),
          // );
          // widgets.add(
          //   Padding(
          //     padding:
          //         const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          //     child: SpringButton(
          //       SpringButtonType.WithOpacity,
          //       customCardWrap(
          //         context,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             cardtitleGoodTimes(getStatus(e)),
          //             cardRowScpace(),
          //             cardItemRowSingle_Normal(
          //                 "QUANNIES (QUANY)  is a crypto resource used by QUANTCHAINs to execute DeActions. Early Access Program (EAP) Discounts have been applied.",
          //                 AppTheme.brandGrey),
          //             cardRowScpace(),
          //             // cardItemRowSingle("100 QUANY"),
          //             itemProperty("1", "123123")
          //           ],
          //         ),
          //       ),
          //       onTap: () {
          //         //   Navigator.push(
          //         //     context,
          //         //   //   MaterialPageRoute(
          //         //   //       builder: (context) => PaymentScreen(productid: 1)),
          //         //   // );
          //       },
          //     ),
          //   ),
          // );
          // widgets.add(
          //   Padding(
          //     padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          //     child: Row(
          //       children: [
          //         Text(
          //           e.time,
          //           style: TextStyle(
          //             fontSize: 13,
          //             fontFamily: AppTheme.fontNameWorkSans,
          //           ),
          //         ),
          //         SizedBox(width: 5),
          //         getIconByStatus(e),
          //         SizedBox(width: 5),
          //         Text(
          //           getStatus(e),
          //           style: TextStyle(
          //             fontSize: 13,
          //             fontFamily: AppTheme.fontNameWorkSans,
          //           ),
          //         ),
          //         SizedBox(width: 5),
          //         Text(
          //           e.amount.toString() + "T",
          //           style: TextStyle(
          //               fontSize: 13,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: AppTheme.fontNameWorkSans,
          //               color: darkTheme
          //                   ? AppDarkTheme.blue
          //                   : AppTheme.primaryRed),
          //         ),
          //         SizedBox(width: 5),
          //         Text(
          //           toValue(e),
          //           style: TextStyle(
          //             fontSize: 13,
          //             fontFamily: AppTheme.fontNameWorkSans,
          //           ),
          //         ),
          //         if (!e.isPayment && !e.isRecipient)
          //           Expanded(
          //               child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: [
          //                 InkWell(
          //                   child:
          //                       Text(e.status == 'Paused' ? 'play' : 'pause'),
          //                   onTap: () => setTransferStatus(
          //                       e,
          //                       e.status == 'Paused'
          //                           ? 'WaitingForAuthToken'
          //                           : 'Paused'),
          //                 ),
          //                 SizedBox(width: 7),
          //                 InkWell(
          //                   child: Text('stop'),
          //                   onTap: () => setTransferStatus(e, 'Stop'),
          //                 )
          //               ]))
          //       ],
          //     ),
          //   ),
          // );
        } else {
          widgets.add(SizedBox(height: 10.0));
          widgets.add(Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15),
            child: Text(
              e.date,
              style: TextStyle(
                fontFamily: AppTheme.fontGoodTimes,
                fontSize: 12,
                color: AppTheme.brandGrey,
              ),
            ),
          ));
        }
      }
    } else {
      // widgets.add(SizedBox(height: 15));
      widgets.add(
        Icon(
          FontAwesomeIcons.rocketLaunch,
          size: 54,
          color: AppTheme.primaryRed,
        ),
      );
      widgets.add(SizedBox(height: 35));
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: titleGoodTimesMd("Welcome to QUANTON"),
      ));
      widgets.add(SizedBox(height: 15));
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: titleGoodTimesMd(" Rocket launch!"),
      ));
      widgets.add(SizedBox(height: 25));
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: infoMesssageSmallSS(
            "QUANTON MATRIX is a starship designed to navigate through QUNATCHAIN ecosystems."),
      ));
      widgets.add(SizedBox(height: 15));
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: infoMesssageSmallSS(
            "Please use a quantum chip button to select QUANTCHAINs. By default, you will be joining the first live QUANTCHAIN ‘QUANTIUM’. ‘QUANTIUM’ is designed for day-to-day operations to digitalize your lifestyle."),
      ));
      widgets.add(SizedBox(height: 15));

      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: infoMesssageSmallSS(
            "Each QUANTCHAIN account should have a positive balance to keep your data active. Please use Store to purchase  QUANNIES (QUANY) - the crypto resource."),
      ));
      widgets.add(SizedBox(height: 15));

      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: infoMesssageSmallSS(
            "The QUANTIUM’s Economy capped to 1 quintillion QUANNIES."),
      ));
      widgets.add(SizedBox(height: 15));

      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: infoMesssageSmallSS(
            "Every QUNATCHAIN citizen (user) is a part of the automated Governance system and has the right to vote and propose."),
      ));
      widgets.add(SizedBox(height: 15));
    }

    widgets.add(SizedBox(height: 10.0));

    return busy
        ? getLoadingWidget()
        : Scaffold(
            drawer: ApplicationDrawer(),
            appBar: AppBar(
              //title: Text("QUANTON"),
              title: InkWell(
                onTap: () {
                  if (animationMenuController.isCompleted) {
                    animationMenuController.reverse();
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EAPScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Early Access Program (EAP)",
                      style: TextStyle(
                          fontFamily: AppTheme.fontNameWorkSans,
                          // decoration: TextDecoration.underline,
                          fontSize: 11,
                          color: AppTheme.brandGrey,
                          fontStyle: FontStyle.normal),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      FontAwesomeIcons.exclamationCircle,
                      size: 11,
                    )
                  ],
                ),
              ),
              iconTheme: IconThemeData(color: AppTheme.brandGrey),
              centerTitle: true,
              //actions: <Widget>[LogoutButton()],
            ),
            body: Stack(
              children: [
                GestureDetector(
                    onTap: () {
                      if (animationMenuController.isCompleted) {
                        animationMenuController.reverse();
                      }
                    },
                    child: Container(
                      // color: AppTheme.background,
                      //decoration: BoxDecoration(color: Colors.red),
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: widgets1),
                    )),
                GestureDetector(
                    onTap: () {
                      if (animationMenuController.isCompleted) {
                        animationMenuController.reverse();
                      }
                    },
                    child: Container(
                      // color: AppTheme.background,
                      height: MediaQuery.of(context).size.height - 260,
                      margin: EdgeInsets.only(top: 90),
                      //decoration: BoxDecoration(color: Colors.blue),
                      child: ListView(
                          shrinkWrap: true,
                          //padding: EdgeInsets.only(top: 85),
                          children: widgets),
                    )),
                bottomBar(() {
                  if (animationMenuController.isCompleted) {
                    animationMenuController.reverse();
                  } else {
                    animationMenuController.forward();
                  }
                }),
                Positioned(
                    right: MediaQuery.of(context).size.width / 2 - 75,
                    bottom: 80,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        IgnorePointer(
                          child: Container(
                            // color: Colors.black.withOpacity(
                            //     0.1), // comment or change to transparent color
                            height: 150.0,
                            width: 150.0,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(270),
                              degOneTranslationAnimation.value * 70),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degOneTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.blue,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onClick: () {
                                animationMenuController.reverse();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuantchainScreen()));
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(225),
                              degTwoTranslationAnimation.value * 70),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degTwoTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.black,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onClick: () {
                                animationMenuController.reverse();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuantchainScreen()));
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(180),
                              degThreeTranslationAnimation.value * 70),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degThreeTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.orangeAccent,
                              width: 50,
                              height: 50,
                              icon: Container(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset("assets/img/28-512.png")),
                              onClick: () {
                                animationMenuController.reverse();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuantchaintbScreen()));
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(-45),
                              degThreeTranslationAnimation.value * 70),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degThreeTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.orangeAccent,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onClick: () {
                                animationMenuController.reverse();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuantchaintbScreen()));
                              },
                            ),
                          ),
                        ),
                        // Transform.translate(
                        //   offset: Offset.fromDirection(
                        //       getRadiansFromDegree(-45),
                        //       degThreeTranslationAnimation.value * 70),
                        //   child: Transform(
                        //     transform: Matrix4.rotationZ(
                        //         getRadiansFromDegree(rotationAnimation.value))
                        //       ..scale(degThreeTranslationAnimation.value),
                        //     alignment: Alignment.center,
                        //     child: CircularButton(
                        //       color: Colors.orangeAccent,
                        //       width: 50,
                        //       height: 50,
                        //       icon: Container(
                        //           width: 25,
                        //           height: 25,
                        //           child: Image.asset(
                        //               "assets/img/qunatum_chip2.png")),
                        //       onClick: () {
                        //         animationMenuController.rever se();
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     QuantchainScreen()));
                        //       },
                        //     ),
                        //   ),
                        // ),
                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(0),
                              degThreeTranslationAnimation.value * 70),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degThreeTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.amber,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onClick: () {
                                animationMenuController.reverse();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuantchainScreen()));
                              },
                            ),
                          ),
                        ),
                        // Transform(
                        //   transform: Matrix4.rotationZ(
                        //       getRadiansFromDegree(rotationAnimation.value)),
                        //   alignment: Alignment.center,
                        //   child: CircularButton(
                        //     color: Colors.red,
                        //     width: 60,
                        //     height: 60,
                        //     icon: Icon(
                        //       Icons.menu,
                        //       color: Colors.white,
                        //     ),
                        //     onClick: () {
                        //       if (animationMenuController.isCompleted) {
                        //         animationMenuController.reverse();
                        //       } else {
                        //         animationMenuController.forward();
                        //       }
                        //     },
                        //   ),
                        // )
                      ],
                    )),
              ],
            ),
          );
  }

  toggleExpand(String id) {
    setState(() {
      if (expanded.contains(id)) {
        expanded.remove(id);
      } else {
        expanded.add(id);
      }
    });
  }

  String toValue(TransferLogs e) {
    if (e.isPayment || e.isRecipient) {
      return e.status == "Completed" ? "ready" : "in process";
    } else {
      if (e.email.isNotEmpty) return "to " + e.email;
      if (e.phone.isNotEmpty) return "to " + e.phone;
    }

    return "unknown";
  }

  Icon getIconByStatus(TransferLogs e) {
    var icon = FontAwesomeIcons.play;
    var size = 10.0;

    if (e.status == 'Completed') {
      icon = FontAwesomeIcons.check;
      size = 13.0;
    } else if (e.status == 'Paused') {
      icon = FontAwesomeIcons.pause;
    }

    return Icon(
      icon,
      size: size,
      color: AppTheme.nearlyBlack,
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SpringButton(
      SpringButtonType.WithOpacity,
      Container(
        // alignment: Alignment.center,s
        decoration: BoxDecoration(
          // color: AppTheme.nearlyWhite,
          gradient: LinearGradient(colors: [
            AppTheme.primaryRed,
            AppTheme.primaryRed,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.primaryRed.withOpacity(0.1),
                offset: const Offset(2.0, 4.0),
                blurRadius: 8.0),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.9),
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(11.5),
              child: icon,
            ),
          ),
        ),
      ),
      onTap: () {
        if (onClick != null) onClick();
      },
    );

    // return Container(
    //   decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    //   width: width,
    //   height: height,
    //   child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    // );
  }
}
