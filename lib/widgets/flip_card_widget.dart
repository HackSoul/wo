import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardWidget extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;
  const FlipCardWidget({Key key, this.frontWidget, this.backWidget}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> frontAnimation;
  Animation<double> backAnimation;

  bool isFront = true;
  bool hasHalf = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animationController.addListener(() {
      if (animationController.value > 0.5) {
        if (hasHalf == false) {
          isFront = !isFront;
        }
        hasHalf = true;
      }
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        hasHalf = false;
      }
    });
    frontAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));
    backAnimation = Tween(begin: 1.5, end: 2.0).animate(CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.5, 1.0, curve: Curves.easeOut)));
  }

  animate() {
    animationController.stop();
    animationController.value = 0;
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = 0;
    if (animationController.status == AnimationStatus.forward) {
      if (hasHalf == true) {
        value = backAnimation.value;
      } else {
        value = frontAnimation.value;
      }
    }

    return GestureDetector(
      onTap: () {
        animate();
      },
      child: Container(
        child: Transform(
          transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * value),
          alignment: Alignment.center,
          child: IndexedStack(
            index: isFront ? 0 : 1,
            children: <Widget>[widget.frontWidget, widget.backWidget],
          ),
        ),
      ),
    );
  }
}