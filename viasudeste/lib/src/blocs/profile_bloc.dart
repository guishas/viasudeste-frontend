import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/login_helper.dart';

class ProfileBloc extends BaseBloc {

  final LoginHelper loginHelper = LoginHelper();

  void initStateScreen() {

  }

  void disposeScreen() {

    disposeBaseBloc();
  }
}