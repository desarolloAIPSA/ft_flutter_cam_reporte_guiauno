import 'package:flutter/material.dart';
import 'dart:math';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../config/app_theme.dart';

class LoadingStatus extends ChangeNotifier {
  List<Widget> loadingGraph = [
    LoadingAnimationWidget.waveDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.inkDrop(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.twistingDots(
      leftDotColor: const Color(0xFF1A1A3F),
      rightDotColor: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.threeRotatingDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.staggeredDotsWave(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.fourRotatingDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.fallingDot(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.prograssiveDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.discreteCircle(
        color: AppTheme.primaryColor,
        size: 100,
        secondRingColor: const Color(0xFF1A1A3F),
        thirdRingColor: AppTheme.primaryColor),
    LoadingAnimationWidget.threeArchedCircle(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.bouncingBall(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.flickr(
      leftDotColor: const Color(0xFF1A1A3F),
      rightDotColor: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.hexagonDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.beat(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.twoRotatingArc(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.horizontalRotatingDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.newtonCradle(
      color: AppTheme.primaryColor,
      size: 2 * 100,
    ),
    LoadingAnimationWidget.stretchedDots(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.halfTriangleDot(
      color: AppTheme.primaryColor,
      size: 100,
    ),
    LoadingAnimationWidget.dotsTriangle(
      color: AppTheme.primaryColor,
      size: 100,
    ),
  ];

  Widget cargando() => getRandom();

  Widget getRandom() {
    var random = Random();
    var randomNumber = random.nextInt(20);
    return loadingGraph[randomNumber];
  }
}
