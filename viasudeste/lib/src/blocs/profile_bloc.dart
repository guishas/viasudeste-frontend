import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';

class ProfileBloc extends BaseBloc {

  final SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  void initStateScreen() {

  }

  void disposeScreen() {

    disposeBaseBloc();
  }
}