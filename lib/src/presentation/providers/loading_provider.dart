import 'package:flutter/material.dart';


class LoadProv with ChangeNotifier {

  bool _regManualPage = false;
  bool _regManualData = false;
  bool _regQr = false;
  bool _trigger = false;

  set regManualPage(bool regManualPage) {
    _regManualPage = regManualPage;
    notifyListeners();
  }
  bool get regManualPage => _regManualPage;


  set regManualData(bool regManualData) {
    _regManualData = regManualData;
    notifyListeners();
  }
  bool get regManualData => _regManualData;


  set regQr(bool regQr) {
    _regQr = regQr;
    notifyListeners();
  }
  bool get regQr => _regQr;


  set trigger(bool trigger) {
    _trigger = trigger;
    notifyListeners();
  }
  bool get trigger => _trigger;


}
