import 'package:flutter/material.dart';

class AnimatedWrapView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final Widget customWidget;
  AnimatedWrapView(
      {Key key, this.animationController, this.animation, this.customWidget})
      : super(key: key);

  @override
  _AnimatedWrapViewState createState() => _AnimatedWrapViewState();
}

class _AnimatedWrapViewState extends State<AnimatedWrapView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.animation.value), 0.0),
              child: widget.customWidget),
        );
      },
    );
  }
}
