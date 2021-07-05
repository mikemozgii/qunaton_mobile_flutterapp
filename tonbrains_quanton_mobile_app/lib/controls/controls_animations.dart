import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/animated_wrap.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

Widget getLoadingWidget([String mode = "none"]) {
  return Material(
    type: MaterialType.transparency,
    child: Container(
      color: darkTheme ? AppDarkTheme.dark : AppTheme.nearlyWhite,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCube(
            color: AppTheme.primaryRed,
            size: 25.0,
          ),
          if (mode == "long")
            SizedBox(
              height: 60,
            ),
          if (mode == "long") titleGoodTimesSM("It can take a few minutes...")
        ],
      ),
    ),
  );
}

Widget getMainListViewUI(
    Function waitFor,
    AnimationController animationController,
    ScrollController scrollController,
    List<Widget> listViews,
    bool showlaoding,
    double listviewHeight) {
  return FutureBuilder<bool>(
    future: waitFor(),
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      if (!snapshot.hasData) {
        if (showlaoding) {
          const spinkit = SpinKitFadingCube(
            color: AppTheme.primaryRed,
            size: 25.0,
          );

          return Container(
            alignment: Alignment.center,
            child: spinkit,
          );
        } else {
          return const Text("");
        }
      } else {
        return Container(
          height: listviewHeight == 0
              ? MediaQuery.of(context).size.height
              : listviewHeight,
          child: ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 15,
                //bottom: 362 + MediaQuery.of(context).padding.bottom,
                left: 16,
                right: 16),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              animationController.forward();
              return listViews[index];
            },
          ),
        );
      }
    },
  );
}

Container getMainContainer(
    BuildContext context,
    Future<bool> Function() waitFor,
    AnimationController animationController,
    ScrollController scrollController,
    List<Widget> listViews,
    {Key scaffoldKey,
    bool showlaoding = true,
    double listviewHeight = 0}) {
  return Container(
    //color: AppTheme.background,
    child: Scaffold(
      key: scaffoldKey,
      //backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          getMainListViewUI(waitFor, animationController, scrollController,
              listViews, showlaoding, listviewHeight),

          // SizedBox(
          //   height: MediaQuery.of(context).padding.bottom,
          // )
        ],
      ),
    ),
  );
}

Widget getSlidableBuilder(
    BuildContext context,
    Widget child,
    Key key,
    SlideActionBuilderDelegate actionDelegate,
    SlideActionBuilderDelegate secondaryActionDelegate,
    Future<bool> Function(SlideActionType) onWillDismiss) {
  return Slidable.builder(
      key: key,
      direction: Axis.horizontal,
      actionPane: SlidableDrawerActionPane(),
      secondaryActionDelegate: secondaryActionDelegate,
      actionDelegate: actionDelegate,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onWillDismiss: onWillDismiss,
        closeOnCanceled: true,
      ),
      child: child);
}

Animation<dynamic> getFlowAnimation(
    int count, int index, AnimationController animationController) {
  return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
}

double getTopBarOpacity() {
  return 0.0;
}

Animation<double> getTopBarAnimation(AnimationController animationController) {
  return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
}

AnimatedWrapView getAnimatedWrapView(
    AnimationController animationController, Widget widget, int widgetCount) {
  return AnimatedWrapView(
    animation: getFlowAnimation(widgetCount, 2, animationController),
    animationController: animationController,
    customWidget: widget,
  );
}

List<Widget> toAnimatedWidgets(
    List<Widget> widgets, AnimationController animationController) {
  List<Widget> listViews = new List<Widget>();

  for (var w in widgets) {
    var index = widgets.indexOf(w);
    listViews.add(
      AnimatedWrapView(
        animation: getFlowAnimation(widgets.length, index, animationController),
        animationController: animationController,
        customWidget: w,
      ),
    );
  }

  return listViews;
}

// extension ExtendedString on List<AnimatedWrapView> {
//   List<AnimatedWrapView> get parseAnimatedWidget(AnimationController animationController, Widget widget) {

//     var index = this.indexOf(widget);
//     var count = this.length;
//     this.add(AnimatedWrapView(
//         animation: getFlowAnimation(count, index, animationController),
//         animationController: animationController,
//         customWidget: widget,
//       ));
//       for(var t in this)
//       {
//         var index2 = this.indexOf(t);
//         t = AnimatedWrapView(
//         animation: getFlowAnimation(count, index2, animationController),
//         animationController: animationController,
//         customWidget: t,
//       );
//       }
//     return this;
//   }
// }

// class WidgetUtil
// {
// static List<Widget> getAnimatedWidgets(List<Widget> widgets, AnimationController animationController, Widget widget) {

//   var index = widgets.

//   return widgets;
// }
// }
