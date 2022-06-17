import 'package:firebase_app/core/enums/viewstate_enum.dart';
import 'package:flutter/material.dart';

abstract class BaseViewmodel extends ChangeNotifier {
  final BuildContext _context;

  BuildContext get context => _context;

  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  void get setBusy => viewState = ViewState.busy;
  void get setIdle => viewState = ViewState.idle;

  bool get isBusy => viewState == ViewState.busy;
  bool get isIdle => viewState == ViewState.idle;

  BaseViewmodel(this._context);

  void initialize() {}
}
