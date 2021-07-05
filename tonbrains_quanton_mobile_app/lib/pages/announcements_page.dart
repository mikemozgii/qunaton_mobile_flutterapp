import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:spring_button/spring_button.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/card_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/controls/helper_functions.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals.dart';

class AnnouncmentsPage extends StatefulWidget {
  AnnouncmentsPage({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _AnnouncmentsPageState createState() => _AnnouncmentsPageState();
}

class _AnnouncmentsPageState extends State<AnnouncmentsPage>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  List<AnnouncementItem> data = [];
  var listViews = <Widget>[];
  var loaded = false;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;
  bool nightMOde = false;
  bool busy = false;
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    nightMOde = appTheme.currentTheme() == ThemeMode.dark;
    topBarAnimation = getTopBarAnimation(animationController);
    //addAllListData();
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

  void addAllListData() {}

  Future<bool> getData() async {
    setState(() {
      busy = true;
    });
    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = AnnouncementsRequest();

      final result =
          await client.getAnnouncements(request, options: apiOptions(options));
      // await Future.delayed(Duration(milliseconds: 750));
      setState(() {
        data = result.items;
        loaded = true;
        busy = false;
      });
    });
    return true;
  }

  Future<bool> showLoader() async {
    await Future.delayed(Duration(milliseconds: 750));
    return Future.value(loaded);
  }

  @override
  Widget build(BuildContext context) {
    listViews = new List<Widget>();
    listViews.add(SizedBox(height: 10));
    listViews.add(Text(
      "Announcments",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: AppTheme.fontGoodTimes,
        //fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: 0.5,
        // color: AppTheme.darkText,
      ),
    ));
    listViews.add(SizedBox(height: 10));
    listViews.addAll(data.map((e) => _anouncmentWidget(e)));

    listViews = toAnimatedWidgets(listViews, animationController);

    return busy
        ? getLoadingWidget()
        : getMainContainer(context, () {
            return showLoader();
          }, animationController, scrollController, listViews);
  }

  Widget _anouncmentWidget(AnnouncementItem item) {
    return SpringButton(
      SpringButtonType.WithOpacity,
      customCardWrap(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardtitleGoodTimes(item.title),
            cardRowScpace(),
            cardItemRowSingle_Normal(item.data, AppTheme.brandGrey),
            cardRowScpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () async =>
                        item.url.isNotEmpty && await canLaunch(item.url)
                            ? await launch(item.url)
                            : null,
                    child: Text(
                      "Read More",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: AppTheme.fontNameWorkSans,
                        color:
                            !nightMOde ? AppTheme.brandGrey : AppDarkTheme.blue,
                      ),
                    )),
                cardDateRight(
                    DateFormat.yMMMd().format(fromUnixTime(item.date)))
              ],
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
