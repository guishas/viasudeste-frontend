import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/models/vendedor_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class RegistrarBloc extends BaseBloc {

  final Api api = Api();
  final SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final List<String> accountOptions = ["Cliente", "Vendedor"];
  
  final selectedOption = BehaviorSubject<String?>.seeded(null);
  final showError = BehaviorSubject<bool?>.seeded(false);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  void initStateScreen() {

  }

  void disposeScreen() {
    selectedOption.close();
    showError.close();

    disposeBaseBloc();
  }

  Future<ClienteModel?> createClienteAccount(GlobalKey<FormState> formState, String email, String password) async {
    if (formState.currentState!.validate() && showError.value != true) {
      isLoading.sink.add(true);

      ClienteModel model = ClienteModel();
      model.clienteEmail = email;
      model.clienteSenha = password;
      model.clienteIsVendedor = false;

      ClienteModel? clienteModel = await api.createClienteAccount(model);

      if (clienteModel != null) {
        isLoading.sink.add(false);
        return clienteModel;
      } else {
        isLoading.sink.add(false);

        Utils().showSnackBar(context, Text('Já existe um usuário com esse e-mail.'));
        return null;
      }
    } else {
      return null;
    }
  }

  Future<VendedorModel?> createVendedorAccount(GlobalKey<FormState> formState, String email, String password) async {
    if (formState.currentState!.validate() && showError.value != true) {
      isLoading.sink.add(true);

      VendedorModel model = VendedorModel();
      model.vendedorEmail = email;
      model.vendedorSenha = password;
      model.vendedorIsVendedor = true;

      VendedorModel? vendedorModel = await api.createVendedorAccount(model);

      if (vendedorModel != null) {
        isLoading.sink.add(false);
        return vendedorModel;
      } else {
        isLoading.sink.add(false);

        Utils().showSnackBar(context, Text('Já existe um usuário com esse e-mail.'));
        return null;
      }
    } else {
      return null;
    }
  }
}