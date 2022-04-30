import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/login_helper.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class LoginBloc extends BaseBloc {

  final Api api = Api();

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

  Future<ClienteModel?> login(BuildContext context, GlobalKey<FormState> formState, String email, String password) async {
    if (formState.currentState!.validate()) {
      isLoading.sink.add(true);

      ClienteModel? clienteModel = await api.loginWithEmailAndPassword(email, password);

      if (clienteModel != null) {
        isLoading.sink.add(false);
        return clienteModel;
      } else {
        isLoading.sink.add(false);

        final SnackBar snackbar = SnackBar(
          content: Text('Dados incorretos.'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        return null;
      }
    } else {
      return null;
    }
  }

  void rememberUser() {
    LoginHelper loginHelper = LoginHelper();
    loginHelper.addBoolToSharedPreferences("isUserLogged", true);
  }
}