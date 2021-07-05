import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/animated_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/controls/card_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/pages/payment_page.dart';

import '../globals.dart';

class DeStoreScreen extends StatefulWidget {
  DeStoreScreen({Key key}) : super(key: key);
  //final AnimationController animationController;

  @override
  _DeStoreScreenState createState() => _DeStoreScreenState();
}

class _DeStoreScreenState extends State<DeStoreScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;

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
    super.initState();
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
    listViews.add(Text(
      "Cryto Resources",
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

    listViews.add(
      SpringButton(
        SpringButtonType.WithOpacity,
        customCardWrap(
          context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardtitleGoodTimes("100 000 QNY"),
              cardRowScpace(),
              cardItemRowSingle_Normal(deactionText3, AppTheme.brandGrey),
              cardRowScpace(),
              cardItemRowSingle_pricewithDiscount(r'$999.98', r"$3499.99")
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentScreen(productid: 1)),
          );
        },
      ),
    );

    listViews.add(SpringButton(
      SpringButtonType.WithOpacity,
      customCardWrap(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardtitleGoodTimes("10 000 QNY"),
            cardRowScpace(),
            cardItemRowSingle_Normal(deactionText3, AppTheme.brandGrey),
            cardRowScpace(),
            cardItemRowSingle_pricewithDiscount(r'$99.98', r"$349.99")
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentScreen(productid: 2)),
        );
      },
    ));

    listViews.add(SpringButton(
      SpringButtonType.WithOpacity,
      customCardWrap(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardtitleGoodTimes("1000 QNY"),
            cardRowScpace(),
            cardItemRowSingle_Normal(deactionText3, AppTheme.brandGrey),
            cardRowScpace(),
            cardItemRowSingle_pricewithDiscount(r"$9.98", r"$34.99")
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentScreen(productid: 3)),
        );
      },
    ));

    listViews.add(SizedBox(height: 30));
    listViews.add(Text(
      "DeApps",
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
    listViews.add(
      customCardWrap(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardtitleGoodTimes("Cyber Wallet (Cooming Soon)"),
            cardRowScpace(),
            cardItemRowSingle_Normal(
                "Cyber Wallet allows you to create your cryptocurrency. Share it with your friends, family, or clients. You can purchase multiple wallets to create a variety of cryptocurrencies. Early Access Program (EAP) Discounts have been applied",
                AppTheme.brandGrey),
            cardRowScpace(),
            cardItemRowSingle_pricewithDiscount(r"1 000 (QNY)", "10 000 (QNY)")
          ],
        ),
      ),
    );

    listViews = toAnimatedWidgets(listViews, animationController);

    return getMainContainer(context, () {
      return getData();
    }, animationController, scrollController, listViews);
  }
}
