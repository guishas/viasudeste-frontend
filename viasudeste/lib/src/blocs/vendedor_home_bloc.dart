import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';

class VendedorHomeBloc extends BaseBloc {

  final currentNavBarIndex = BehaviorSubject<int>.seeded(1);

  PageController pageController = new PageController(initialPage: 1);

  void initStateScreen() {

  }

  void disposeScreen() {
    currentNavBarIndex.close();

    disposeBaseBloc();
  }
}