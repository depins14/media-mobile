import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:media/model/soal_model.dart';

// ignore: deprecated_member_use
class SoalController {
  late AnimationController _animationController;

  Animation? _animation;
  Animation? get animation => _animation;

  PageController? _pageController;
  PageController? get pageController => _pageController;
}
