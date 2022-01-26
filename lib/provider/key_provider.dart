import 'package:flutter/material.dart';

class KeyProvider extends ChangeNotifier {
  late GlobalKey<ScaffoldState> _drawerKey;

  GlobalKey<ScaffoldState> get drawerKey => _drawerKey;

  void setDrawerKey(key) {
    _drawerKey = key;

    notifyListeners();
  }
}
