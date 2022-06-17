import 'package:flutter/material.dart';

enum ViewState { busy, idle }

abstract class CustomBaseViewModel extends ChangeNotifier {
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

  CustomBaseViewModel(this._context);

  void initialize() {}
}
