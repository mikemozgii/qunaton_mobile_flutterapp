import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';
import 'package:tonbrains_quanton_mobile_app/pages/announcements_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/contacts_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/invite_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/report_issue_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/signin_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';
import 'package:tonbrains_quanton_mobile_app/services/auth_svc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';

import 'avatar_text_box.dart';
// import 'package:univintel_gbn_app/controls/avatar_text_box.dart';
// import 'package:univintel_gbn_app/models/company.dart';
// import 'package:univintel_gbn_app/pages/company/company_dashboard.dart';
// import 'package:univintel_gbn_app/pages/company/edit_company.dart';
// import 'package:univintel_gbn_app/pages/discounts/discounts.dart';
// import 'package:univintel_gbn_app/controls/basic_inputs.dart';
// import 'package:univintel_gbn_app/pages/jobs/root.dart';
// import 'package:univintel_gbn_app/pages/news/news.dart';
// import 'package:univintel_gbn_app/pages/products/products.dart';
// import 'package:univintel_gbn_app/localization.dart';
// import 'package:univintel_gbn_app/pages/company/companies.dart';
// import 'package:univintel_gbn_app/pages/companyCulture/root.dart';
// import 'package:univintel_gbn_app/pages/companyContacts/contacts.dart';
// import 'package:univintel_gbn_app/pages/companyLocations/locations.dart';
// import 'package:univintel_gbn_app/pages/account_edit_info.dart';
// import 'package:univintel_gbn_app/pages/investmentsPortfolio/edit_portfolio.dart';
// import 'package:univintel_gbn_app/pages/investmentsPortfolio/companySummary/company_summary.dart';
// import 'package:univintel_gbn_app/pages/investmentsPortfolio/annualFinancials/root.dart';
// import 'package:univintel_gbn_app/pages/investmentsPortfolio/companyDocuments/root.dart';
// import 'package:univintel_gbn_app/pages/investmentsPortfolio/fundingHistory/root.dart';
// import 'package:univintel_gbn_app/pages/promotes/promotes.dart';
// import 'package:univintel_gbn_app/pages/companyEmployee/root.dart';
// import 'package:univintel_gbn_app/pages/dashboard.dart';

// import 'avatar_box.dart';
// import 'helper_functions.dart';

class ApplicationDrawer extends StatefulWidget {
  final bool showCompanyMenu;
  final bool showInvestmentsProfileMenu;
  final String itemId;
  // final List<Company> companies;

  ApplicationDrawer(
      {Key key,
      this.showCompanyMenu = false,
      this.itemId = "",
      this.showInvestmentsProfileMenu = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ApplicationDrawerState();
}

class ApplicationDrawerState extends State<ApplicationDrawer> {
  GetSmartAccountReply smartAccount = GetSmartAccountReply();

  String userEmail = "";
  bool nightMOde = false;
  //String userAvatar = "";
  //String accountRank = "";
  //bool isPaid = false;
  bool showAdditionalOptions = false;
  //bool needUpdateCompanies = true;
  //bool showPortfolio = false;
  // List<Company> companies = new List<Company>();
  //bool isEmployee = false;

  @override
  void initState() {
    super.initState();
    nightMOde = appTheme.currentTheme() == ThemeMode.dark;
    // appTheme.addListener(() {
    //   if (mounted) setState(() {});
    // });
    getData();
  }

  void getData() async {
    var user = await Provider.of<AuthService>(context, listen: false).getUser();
    userEmail = user.email;
    // nightMOde = user.nightMode;
    // final storage = new FlutterSecureStorage();
    // final email = await storage.read(key: "user_email");
    // String name = await storage.read(key: "user_name");
    // String avatar = await storage.read(key: "user_avatar");
    // var isUserEmployee = await storage.read(key: "user_isemployee");
    // var rankId = await storage.read(key: "account_rank");

    // if (name == null) name = "No set";
    // if (avatar == null) avatar = "";

    // var companiesResponse;
    // if (widget.companies != null) companiesResponse = await apiGetResult("api/1/companies/all", context);

    getSmartAccount();

    setState(() {
      userEmail = user.email;
      // nightMOde = user.nightMode;
      // userAvatar = avatar;
      // isEmployee = isUserEmployee == "true";
      // accountRank = rankId;
      // if (companiesResponse != null) {
      //   companies = List<Company>.from(companiesResponse.map((map) => Company.fromJson(map)));
      // }
    });
  }

  Future getSmartAccount() async {
    if (smartAccount.address == "") {
      await prepareApiSession(
          (ClientChannel channel, Map<String, String> options) async {
        final client = TonMobileClient(channel);

        final result = await client.getSmartAccount(GetSmartAccountRequest(),
            options: apiOptions(options));

        setState(() {
          smartAccount = result;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        color: !nightMOde ? AppTheme.nearlyWhite : AppDarkTheme.dark,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: ListView(children: _fillOptions()),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      "QUANTON | Version 1.0",
                      style: TextStyle(
                        fontSize: 9,
                        fontFamily: AppTheme.fontNameWorkSans,
                        color: !nightMOde
                            ? AppTheme.nearlyBlack
                            : AppDarkTheme.blue,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "© TON BRAINS LLP 2021 Copyrigths. All rights reserved",
                      style: TextStyle(
                        fontSize: 9,
                        fontFamily: AppTheme.fontNameWorkSans,
                        color: !nightMOde
                            ? AppTheme.nearlyBlack
                            : AppDarkTheme.blue,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//_fillOptions()
  // void goNewsPage() {
  //   Navigator.pop(context);
  //   Navigator.push(context, new MaterialPageRoute(builder: (ctxt) => NewsPage(companyId: widget.itemId)));
  // }

  String getShortName(String name) {
    if (name == null || name == "" || name == " ") return "NN";

    var parts = name.split(" ");
    if (parts.length == 2) return parts[0][0] + parts[1][0];

    return name.substring(0, 2);
  }

  List<Widget> _fillOptions() {
    List<Widget> result = new List<Widget>();
    result.add(Container(
      color: !nightMOde ? AppTheme.primaryRed : AppDarkTheme.lightdark,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AvatarTextBox(getShortName(userEmail), 30, fontSize: 20),
                Expanded(
                  child: Container(
                    height: 65,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () async {
                          await appTheme.setTheme(nightMOde ? "main" : "dark");
                          setState(() {
                            nightMOde =
                                appTheme.currentTheme() == ThemeMode.dark;
                          });
                          await Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => HomePage()),
                          );
                        },
                        icon: Icon(
                          !nightMOde
                              ? FontAwesomeIcons.solidMoon
                              : FontAwesomeIcons.sun,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // flex: 6,
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 10, 0),
              child: Row(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                          width: 235,
                          child: Text(userEmail,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.white,
                                fontFamily: AppTheme.fontNameWorkSans,
                              )),
                        )
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          showAdditionalOptions
                              ? "Hide Security Info"
                              : "Show Security Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppTheme.fontGoodTimes,
                              fontSize: 9.0))
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                            onTap: () async {
                              if (!showAdditionalOptions) {
                                await getSmartAccount();
                              }

                              setState(() {
                                showAdditionalOptions = !showAdditionalOptions;
                              });
                            },
                            child: showAdditionalOptions
                                ? Icon(Icons.arrow_drop_up, color: Colors.white)
                                : Icon(Icons.arrow_drop_down,
                                    color: Colors.white))),
                    flex: 2)
              ])),
        ]),
        decoration: BoxDecoration(border: Border.all(width: 0)),
      ),
    ));

    if (showAdditionalOptions) {
      result.add(
        InkWell(
          child: ListTile(
            onTap: () async {
              await FlutterClipboard.copy(smartAccount.address);
              final scaffold = Scaffold.of(context);
              scaffold.removeCurrentSnackBar();
              scaffold.showSnackBar(SnackBar(
                elevation: 17,
                duration: Duration(seconds: 2),
                content: Text('Copied to clipboard'),
              ));
              Navigator.pop(context);
            },
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // RaisedButton.icon(
                  //   label: Text("copy"),
                  //   // color: AppTheme.white,
                  //   // textColor: AppTheme.primaryRed,

                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(18.0),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => HomePage()),
                  //     );
                  //   },
                  //   icon: Icon(
                  //     FontAwesomeIcons.copy,
                  //     // color: AppTheme.primaryRed,
                  //     size: 12,
                  //   ),
                  // ),
                  //infoMesssageSmall("Copy"),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Icon(
                        FontAwesomeIcons.copy,
                        size: 12,
                        color:
                            !nightMOde ? AppTheme.brandGrey : AppDarkTheme.blue,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Copy",
                        style: TextStyle(
                          fontFamily: AppTheme.fontNameWorkSans,
                          fontSize: 12,
                          color: !nightMOde
                              ? AppTheme.brandGrey
                              : AppDarkTheme.blue,
                        ),
                      )
                    ]),
                  ),

                  titleGoodTimesRight("Address")
                ]),
            title: bodyGoodTimesRight(smartAccount.address),
          ),
        ),
      );
      result.add(
        InkWell(
          child: ListTile(
            onTap: () async {
              await FlutterClipboard.copy(smartAccount.publicKey);
              final scaffold = Scaffold.of(context);
              scaffold.removeCurrentSnackBar();
              scaffold.showSnackBar(SnackBar(
                elevation: 17,
                duration: Duration(seconds: 2),
                content: Text('Copied to clipboard'),
              ));
              Navigator.pop(context);
            },
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Icon(
                        FontAwesomeIcons.copy,
                        size: 12,
                        color:
                            !nightMOde ? AppTheme.brandGrey : AppDarkTheme.blue,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Copy",
                        style: TextStyle(
                          fontFamily: AppTheme.fontNameWorkSans,
                          fontSize: 12,
                          color: !nightMOde
                              ? AppTheme.brandGrey
                              : AppDarkTheme.blue,
                        ),
                      )
                    ]),
                  ),
                  titleGoodTimesRight("Public Key")
                ]),
            title: bodyGoodTimesRight(smartAccount.publicKey),
          ),
        ),
      );
      result.add(
        InkWell(
          child: ListTile(
            onTap: () async {
              await FlutterClipboard.copy(smartAccount.secretKey);
              final scaffold = Scaffold.of(context);
              scaffold.removeCurrentSnackBar();
              scaffold.showSnackBar(SnackBar(
                elevation: 17,
                duration: Duration(seconds: 2),
                content: Text('Copied to clipboard'),
              ));
              Navigator.pop(context);
            },
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(children: [
                      Icon(
                        FontAwesomeIcons.copy,
                        size: 12,
                        color:
                            !nightMOde ? AppTheme.brandGrey : AppDarkTheme.blue,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Copy",
                        style: TextStyle(
                          fontFamily: AppTheme.fontNameWorkSans,
                          fontSize: 12,
                          color: !nightMOde
                              ? AppTheme.brandGrey
                              : AppDarkTheme.blue,
                        ),
                      )
                    ]),
                  ),
                  titleGoodTimesRight("Secret Key")
                ]),
            title: bodyGoodTimesRight(smartAccount.secretKey),
          ),
        ),
      );

      if (smartAccount.mnemonicPhrase != "") {
        result.add(
          InkWell(
            child: ListTile(
              onTap: () async {
                await FlutterClipboard.copy(smartAccount.mnemonicPhrase);
                final scaffold = Scaffold.of(context);
                scaffold.removeCurrentSnackBar();
                scaffold.showSnackBar(SnackBar(
                  elevation: 17,
                  duration: Duration(seconds: 2),
                  content: Text('Copied to clipboard'),
                ));
                Navigator.pop(context);
              },
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Row(children: [
                        Icon(
                          FontAwesomeIcons.copy,
                          size: 12,
                          color: !nightMOde
                              ? AppTheme.brandGrey
                              : AppDarkTheme.blue,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Copy",
                          style: TextStyle(
                            fontFamily: AppTheme.fontNameWorkSans,
                            fontSize: 12,
                            color: !nightMOde
                                ? AppTheme.brandGrey
                                : AppDarkTheme.blue,
                          ),
                        )
                      ]),
                    ),
                    titleGoodTimesRight("Phrase")
                  ]),
              title: bodyGoodTimesRight(smartAccount.mnemonicPhrase),
            ),
          ),
        );
      }
    }
    result.add(
      navMenuItem(
        "Announcement ",
        FontAwesomeIcons.solidBullhorn,
        () async => await Navigator.push(
          context,
          new MaterialPageRoute(builder: (ctxt) => AnnouncmentsPage()),
        ),
      ),
    );

    result.add(
      navMenuItem(
        "Invite Friends",
        FontAwesomeIcons.solidUserPlus,
        () async => await Navigator.push(
          context,
          new MaterialPageRoute(builder: (ctxt) => InviteScreen()),
        ),
      ),
    );
    result.add(
      navMenuItem(
        "Sing Out",
        FontAwesomeIcons.solidSignOutAlt,
        () async {
          await Provider.of<AuthService>(context, listen: false).logout();
          await Navigator.push(
            context,
            new MaterialPageRoute(builder: (ctxt) => LoginPage()),
          );
        },
      ),
    );

    result.add(
      navMenuItem(
        "TON BRAINS",
        FontAwesomeIcons.solidGlobe,
        () async {
          const url = "https://tonbrains.com/";
          if (await canLaunch(url)) await launch(url);
        },
      ),
    );

    result.add(
      navMenuItem(
        "Community",
        FontAwesomeIcons.discord,
        () async {
          const url = "https://discord.com/invite/tN4tsVb";
          if (await canLaunch(url)) await launch(url);
        },
      ),
    );

    // result.add(
    //   navMenuItem(
    //     "FAQ",
    //     FontAwesomeIcons.solidComment,
    //     () async {
    //       // const url = "https://discord.com/invite/tN4tsVb";
    //       // if (await canLaunch(url)) await launch(url);
    //     },
    //   ),
    // );

    result.add(
      navMenuItem(
        "Report Issue",
        FontAwesomeIcons.solidExclamationTriangle,
        () async => await Navigator.push(
          context,
          new MaterialPageRoute(builder: (ctxt) => ReportIssuePage()),
        ),
      ),
    );
    result.add(
      navMenuItem(
        "Privacy Policy",
        FontAwesomeIcons.solidUserShield,
        () async {
          const url = "https://tonbrains.com//privacyPolicy";
          if (await canLaunch(url)) await launch(url);
        },
      ),
    );

    result.add(
      navMenuItem(
        "Terms of Use",
        FontAwesomeIcons.solidBook,
        () async {
          const url = "https://tonbrains.com/termsOfUse";
          if (await canLaunch(url)) await launch(url);
        },
      ),
    );

    // result.add(Expanded(

    // ));

    // result.add(Text(
    //   "asdad",
    // ));

    //   if (widget.companies != null && !isEmployee) {
    //     for (var company in companies) {
    //       var companyId = company.id;
    //       result.add(ListTile(
    //         leading: Container(
    //           width: 30,
    //           height: 30,
    //           child: Align(child: company.logoId != null ? AvatarBox(company.logoId , 30, localFileIfNotSpecifiedPath: 'assets/images/image_not_found.png',) : AvatarTextBox(company.name.substring(0,2), 30, fontSize: 14))
    //         ),
    //         title: Text(company.name, style: menuOptionTextStyle()),
    //         onTap: () => goCompanyPage(companyId)
    //       ));
    //     }
    //     result.add(ListTile(
    //       leading: Icon(Icons.add, color: systemGrayColor()),
    //       title: Text(UnivIntelLocale.of(context, "addcompany"), style: menuOptionTextStyle()),
    //       onTap: () => goAddCompanyPage()
    //     ));
    //   }

    return result;
  }

  TextStyle menuOptionTextStyle() {
    return TextStyle(
      fontSize: 15,
      fontFamily: AppTheme.fontGoodTimes,
      // color: AppTheme.dark_grey
    );
  }
}
