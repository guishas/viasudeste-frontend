import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc {
  bool isOccupied = false;

  final isLoading = BehaviorSubject<bool>();
  Stream<bool> get isLoadingStream => isLoading.stream;

  late BuildContext context;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  void configContext(BuildContext currentContext, GlobalKey<ScaffoldState> currentScaffoldState) {
    context = currentContext;
    scaffoldState = currentScaffoldState;
  }

  void disposeBaseBloc() {
    isLoading.close();
  }
}