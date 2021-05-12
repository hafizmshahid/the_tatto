import 'package:flutter/material.dart';
import 'package:the_tatto/viewmodel/app_satate.dart';


class BaseViewModel extends ChangeNotifier {
  ViewState _appState = ViewState.kIdle;
  ViewState get state => _appState;

  void setState(ViewState state) {
    _appState = state;
    notifyListeners();
  }
}