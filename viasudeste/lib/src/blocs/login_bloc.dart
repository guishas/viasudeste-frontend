import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class LoginBloc extends BaseBloc {

  final Api api = Api();
  final SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final rememberMe = BehaviorSubject<bool>.seeded(false);
  final showPassword = BehaviorSubject<bool>.seeded(false);

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void initStateScreen() {

  }

  void disposeScreen() {
    rememberMe.close();
    showPassword.close();

    disposeBaseBloc();
  }

  Future<dynamic> login(BuildContext context, GlobalKey<FormState> formState, String email, String password) async {
    if (formState.currentState!.validate()) {
      isLoading.sink.add(true);

      dynamic model = await api.loginWithEmailAndPassword(email, password);

      if (model != null) {
        isLoading.sink.add(false);
        return model;
      } else {
        isLoading.sink.add(false);

        Utils().showSnackBar(context, Text('Dados inválidos.'));
        return null;
      }
    } else {
      return null;
    }
  }

  void rememberUser() {
    sharedPreferencesHelper.addBoolToSharedPreferences("rememberUser", true);
  }
}