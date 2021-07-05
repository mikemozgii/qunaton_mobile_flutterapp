import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/pages/mnemonic_phrase_signin_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/public_secret_key_signin_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/email_signin.dart';
import 'package:tonbrains_quanton_mobile_app/pages/create_new_account.dart';
import 'package:tonbrains_quanton_mobile_app/services/auth_svc.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  AnimationController _controller;
  Animation _myAnimation;
  Animation<double> _slideAnimation;
  AnimationController _controllerLogin;
  Animation _myLoginAnimation;

  var busy = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1250),
    );
    _myAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInBack);

    _controllerLogin = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );
    _myLoginAnimation =
        CurvedAnimation(parent: _controllerLogin, curve: Curves.easeInBack);

    _slideAnimation = Tween(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    _controller.forward();
    _controllerLogin.forward();

    getData();
  }

  void getData() async {
    setState(() {
      busy = true;
    });
    Provider.of<AuthService>(context, listen: false).validaTeApiVersion();

    setState(() {
      busy = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login Page Flutter Firebase"),
      // ),
      body: busy
          ? getLoadingWidget("long")
          : Container(
              padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
              child: Form(
                key: _formKey,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      // SizedBox(
                      //   height: 50,
                      // ),
                      AnimatedBuilder(
                        animation: _slideAnimation,
                        builder: (ctx, ch) => Container(
                            width: 165,
                            height: 165,
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.only(
                              top: _slideAnimation.value,
                            ),
                            child: Image(
                              image: AssetImage('assets/img/tonbrains2.png'),
                              width: 350,
                            )),
                      ),

                      // FadeTransition(
                      //     opacity: _myAnimation,
                      //     child: Image(
                      //       image: AssetImage('assets/img/logo_tonbrains.jpg'),
                      //       width: 150,
                      //     )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeTransition(
                        opacity: _myAnimation,
                        child: Center(
                          child: Text(
                            "TON BRAINS",
                            style: TextStyle(
                                letterSpacing: 4.0,
                                fontSize: 30,
                                fontFamily: AppTheme.fontGoodTimes,
                                color: AppTheme.primaryRed),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // FadeTransition(
                      //   opacity: _myAnimation,
                      //   child: Center(
                      //     child: Text(
                      //       "MATRIX",
                      //       style: TextStyle(
                      //           letterSpacing: 4.0,
                      //           fontSize: 16,
                      //           fontFamily: AppTheme.fontGoodTimes,
                      //           color: AppTheme.primaryRed),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      FadeTransition(
                        opacity: _myAnimation,
                        child: Center(
                          child: Text(
                            "Crypto Asset Management",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppTheme.brandGrey,
                                fontFamily: AppTheme.fontGoodTimes,
                                fontSize: 12),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      FadeTransition(
                        opacity: _myAnimation,
                        child: Center(
                          child: Text(
                            "Operating System",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppTheme.brandGrey,
                                fontFamily: AppTheme.fontGoodTimes,
                                fontSize: 12),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      FadeTransition(
                        opacity: _myLoginAnimation,
                        child: SizedBox(
                          width: 200,
                          child: RaisedButton(
                            child: Text(
                              "Sign In",
                            ),
                            color: AppTheme.primaryRed,
                            textColor: AppTheme.nearlyWhite,

                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            // splashColor: Colors.white,
                            // animationDuration: Duration(seconds: 1),
                            onPressed: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmailSignInScreen(),
                                  ));
                            },

                            // icon: Icon(
                            //   FontAwesomeIcons.solidSignIn,
                            //   // color: AppTheme.primaryRed,
                            //   size: 12,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FadeTransition(
                        opacity: _myLoginAnimation,
                        child: SizedBox(
                          width: 200,
                          child: RaisedButton(
                            child: Text(
                              "Create New Account",
                            ),
                            // color: AppTheme.nearlyWhite,
                            // textColor: AppTheme.primaryRed,

                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            // splashColor: Colors.white,
                            // animationDuration: Duration(seconds: 1),
                            onPressed: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CreateNewAccountScreen(),
                                  ));
                            },

                            // icon: Icon(
                            //   FontAwesomeIcons.solidSignIn,
                            //   // color: AppTheme.primaryRed,
                            //   size: 12,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // FadeTransition(
                      //   opacity: _myLoginAnimation,
                      //   child: SizedBox(
                      //     width: 200,
                      //     child: RaisedButton.icon(
                      //       label: Text("Facebook"),
                      //       // color: AppTheme.nearlyWhite,
                      //       // textColor: AppTheme.primaryRed,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(18.0),
                      //       ),
                      //       onPressed: () async {
                      //         // var result =
                      //         //     await Provider.of<AuthService>(context, listen: false)
                      //         //         .googleSignInUser();
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //       builder: (context) => HomePage(result),
                      //         //     ));
                      //       },
                      //       icon: Icon(
                      //         FontAwesomeIcons.facebookF,
                      //         // color: AppTheme.primaryRed,
                      //         size: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // FadeTransition(
                      //   opacity: _myLoginAnimation,
                      //   child: SizedBox(
                      //     width: 200,
                      //     child: RaisedButton.icon(
                      //       label: Text("Apple"),
                      //       // color: AppTheme.white,
                      //       // textColor: AppTheme.primaryRed,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(18.0),
                      //       ),
                      //       onPressed: () async {
                      //         // var result =
                      //         //     await Provider.of<AuthService>(context, listen: false)
                      //         //         .googleSignInUser();
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //       builder: (context) => HomePage(result),
                      //         //     ));
                      //       },
                      //       icon: Icon(
                      //         FontAwesomeIcons.apple,
                      //         // color: AppTheme.primaryRed,
                      //         size: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // FadeTransition(
                      //   opacity: _myLoginAnimation,
                      //   child: SizedBox(
                      //     width: 200,
                      //     child: RaisedButton.icon(
                      //       label: Text("Keys"),
                      //       // color: AppTheme.white,
                      //       // textColor: AppTheme.primaryRed,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(18.0),
                      //       ),
                      //       onPressed: () async {
                      //         var result = await Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) =>
                      //                   PublicSecretKeySignInPage(),
                      //             ));
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //       builder: (context) => HomePage(result),
                      //         //     ));
                      //       },
                      //       icon: Icon(
                      //         FontAwesomeIcons.solidKey,
                      //         // color: AppTheme.primaryRed,
                      //         size: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // FadeTransition(
                      //   opacity: _myLoginAnimation,
                      //   child: SizedBox(
                      //     width: 200,
                      //     child: RaisedButton.icon(
                      //       label: Text("Phrase"),
                      //       // color: AppTheme.white,
                      //       // textColor: AppTheme.primaryRed,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(18.0),
                      //       ),
                      //       onPressed: () async {
                      //         var result = await Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) =>
                      //                   MnemonicPhraseSignInPage(),
                      //             ));
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //       builder: (context) => HomePage(result),
                      //         //     ));
                      //       },
                      //       icon: Icon(
                      //         FontAwesomeIcons.list,
                      //         // color: AppTheme.primaryRed,
                      //         size: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 60,
                      ),
                      FadeTransition(
                        opacity: _myAnimation,
                        child: Center(
                          child: Text(
                            "Early Access (alpha)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppTheme.dark_grey,
                                //fontFamily: AppTheme.fo,
                                fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeTransition(
                        opacity: _myAnimation,
                        child: Text(
                          "TON BRAINS Inc.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: AppTheme.fontNameWorkSans,
                              color: AppTheme.brandGrey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeTransition(
                        opacity: _myAnimation,
                        child: Text(
                          "© 2021 Copyrigths. All rights reserved",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: AppTheme.fontNameWorkSans,
                              color: AppTheme.brandGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
