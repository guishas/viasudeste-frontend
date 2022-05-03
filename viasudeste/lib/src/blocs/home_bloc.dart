import 'package:flutter/cupertino.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';

class HomeBloc extends BaseBloc {

  TextEditingController searchController = new TextEditingController();

  void initStateScreen() {

  }

  void disposeScreen() {

    disposeBaseBloc();
  }
}