import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';

class LoginBloc extends BaseBloc {

  final rememberMe = BehaviorSubject<bool>.seeded(false);

  void initStateScreen() {

  }

  void disposeScreen() {
    rememberMe.close();

    disposeBaseBloc();
  }
}