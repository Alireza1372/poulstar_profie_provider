import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poulstar_profile/main.dart';

class RedHeart with ChangeNotifier {
  IconData _iconData = CupertinoIcons.heart;

  IconData get iconData => _iconData;

  void changeIcon() {
    _iconData = _iconData == CupertinoIcons.heart_fill
        ? CupertinoIcons.heart
        : CupertinoIcons.heart_fill;
    notifyListeners();
  }
}

class LanguageShadow with ChangeNotifier {
  String _languageSelect = languages[0];

  set setShadow(shadow) => _languageSelect = shadow;
  String get getShadow => _languageSelect;

  void changeShadowLanguages() {
    _languageSelect = getShadow;
    notifyListeners();
  }
}

class FrameworkShadow with ChangeNotifier {
  String _frameworkSelect = frameWorks[0];

  set setShadow(shadow) => _frameworkSelect = shadow;
  String get getShadow => _frameworkSelect;

  void changeShadowFrameWorks() {
    _frameworkSelect = getShadow;
    notifyListeners();
  }
}

class ChangeTheme with ChangeNotifier {
  IconData _iconData = Icons.nightlight_round;

  IconData get iconData => _iconData;

  void changeIcon() {
    _iconData = _iconData == Icons.sunny ? Icons.nightlight_round : Icons.sunny;
    notifyListeners();
  }
}
