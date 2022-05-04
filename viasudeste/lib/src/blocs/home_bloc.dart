import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';

class HomeBloc extends BaseBloc {

  final currentNavBarIndex = BehaviorSubject<int>.seeded(2);

  PageController pageController = new PageController(initialPage: 2);

  void initStateScreen() {

  }

  void disposeScreen() {
    currentNavBarIndex.close();

    disposeBaseBloc();
  }
}