import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/controls/helper_functions.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/validators.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportIssuePage extends StatefulWidget {
  final String mode;

  ReportIssuePage({Key key, this.mode}) : super(key: key);

  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Animation<double> topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;

  String description = "";
  String title = "";
  Map<String, String> files = {};

  Future<bool> showLoader() async {
    await Future.delayed(Duration(milliseconds: 750));
    return true;
  }

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

  @override
  Widget build(BuildContext context) {
    var listViews = new List<Widget>();
    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Report Issue"));
    listViews.add(SizedBox(height: 35));
    listViews.add(Icon(
      FontAwesomeIcons.solidBug,
      size: 64,
      color: AppTheme.primaryRed,
    ));
    listViews.add(SizedBox(height: 35));
    listViews.add(infoMesssageSmall(
        "Please describe the issue and attach screenshots if necessary. Our Support team will get back to you as soon as possible. Alternatively, you can submit the issue using Community"));
    listViews.add(SizedBox(height: 10));
    listViews.add(SizedBox(height: 20));
    // listViews.add(
    //   TextFormField(
    //     initialValue: title,
    //     keyboardType: TextInputType.text,
    //     onChanged: (value) => setState(() {
    //       title = value;
    //     }),
    //     validator: (value) => textValidate(value),
    //     decoration: textFieldDecoration("Title"),
    //   ),
    // );
    listViews.add(SizedBox(height: 20));
    listViews.add(
      TextFormField(
        initialValue: description,
        keyboardType: TextInputType.text,
        minLines: 5,
        maxLines: 10,
        onChanged: (value) => setState(() {
          description = value;
        }),
        validator: (value) => textValidate(value),
        decoration: textFieldDecoration("Bug Description"),
      ),
    );
    listViews.add(SizedBox(height: 20));
    listViews.add(SizedBox(height: 20));
    listViews.add(
      RaisedButton.icon(
        label: Text("Attached Files ${files.length}"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          FilePickerResult result = await FilePicker.platform.pickFiles();

          if (result != null) {
            files = Map.fromIterable(result.files,
                key: (e) => e.name,
                value: (e) => base64Encode(File(e.path).readAsBytesSync()));
          }
          setState(() {});
        },
        icon: Icon(
          FontAwesomeIcons.solidFile,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 10));
    listViews.add(
      RaisedButton.icon(
        label: Text("Send Report"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => createIssue(),
        icon: Icon(
          FontAwesomeIcons.solidBug,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    listViews.add(SizedBox(height: 20));
    listViews.add(
      RaisedButton.icon(
        label: Text("Community"),
        // color: AppTheme.white,
        // textColor: AppTheme.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          const url = "https://discord.com/invite/tN4tsVb";
          if (await canLaunch(url)) await launch(url);
        },
        icon: Icon(
          FontAwesomeIcons.discord,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );
    listViews = toAnimatedWidgets(listViews, animationController);

    return Form(
        key: formKey,
        child: getMainContainer(context, () {
          return showLoader();
        }, animationController, scrollController, listViews));
  }

  Future createIssue() async {
    if (!formKey.currentState.validate()) return;

    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = SaveIssueRequest()
        ..title = "some system data"
        ..description = description
        ..files.addAll(files);

      final result =
          await client.saveIssue(request, options: apiOptions(options));

      Navigator.pop(context);
    });
  }
}
