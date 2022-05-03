import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';

class MainBloc extends BaseBloc {

  TextEditingController searchController = new TextEditingController();

  void initStateScreen() {

  }

  void disposeScreen() {

    disposeBaseBloc();
  }
}