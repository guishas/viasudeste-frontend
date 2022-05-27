import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/cidade_model.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/models/estado_model.dart';
import 'package:viasudeste/src/models/update_cliente_model.dart';
import 'package:viasudeste/src/models/update_vendedor_model.dart';
import 'package:viasudeste/src/models/user_model.dart';
import 'package:viasudeste/src/models/vendedor_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class PersonalDataBloc extends BaseBloc {

  final Api api = Api();

  UserModel? user;

  final estadosList = BehaviorSubject<List<EstadoModel>?>.seeded(null);
  final selectedEstado = BehaviorSubject<String?>.seeded(null);

  final cidadesList = BehaviorSubject<List<CidadeModel>?>.seeded([]);
  final selectedCidade = BehaviorSubject<String?>.seeded(null);

  final TextEditingController emailController = TextEditingController(text: null);
  final TextEditingController celularController = TextEditingController(text: null);
  final TextEditingController cpfController = TextEditingController(text: null);
  final TextEditingController cepController = TextEditingController(text: null);
  final TextEditingController addressController = TextEditingController(text: null);

  void initStateScreen() {
    user = ObjMem.currentUser;

    checkUser();

    getEstados();
  }

  void disposeScreen() {
    estadosList.close();
    selectedEstado.close();
    cidadesList.close();
    selectedCidade.close();

    disposeBaseBloc();
  }

  void getEstados() async {
    final _list = await api.getEstados();

    if (_list != null) {
      estadosList.sink.add(_list);
    }
  }

  void getCidades(String estadoId) async {
    final _list = await api.getCidadesByEstadoId(estadoId);

    if (_list != null) {
      cidadesList.sink.add(_list);
    }
  }

  void checkUser() {
    if (user != null) {
      emailController.text = user!.userEmail!;
      celularController.text = user!.userCelular!;
      cpfController.text = user!.userCPF!;
      cepController.text = user!.userCEP!;
      addressController.text = user!.userEndereco!;

      if (user!.userEstadoId != null) {
        selectedEstado.sink.add(user!.userEstadoId);
      }

      if (user!.userCidadeId != null) {
        selectedCidade.sink.add(user!.userCidadeId);
      }
    }
  }

  Future<void> updateUser(BuildContext context) async {
    if (user!.userIsVendedor == false) {
      UpdateClienteModel model = UpdateClienteModel();
      model.clienteId = user!.userId;
      model.clienteNome = user!.userNome;
      model.clienteEmail = emailController.text;
      model.clienteCelular = celularController.text;
      model.clienteCPF = cpfController.text;
      model.clienteCEP = cepController.text;
      model.clienteEndereco = addressController.text;
      model.clienteEstadoId = selectedEstado.value;
      model.clienteCidadeId = selectedCidade.value;
      model.clienteLatitude = 0;
      model.clienteLongitude = 0;
      model.clienteIsVendedor = false;

      ClienteModel? updatedModel = await api.updateCliente(model);

      if (updatedModel != null) {
        ObjMem.currentUser = UserModel.fromJson(updatedModel.toJson(), updatedModel.clienteIsVendedor!);
        Utils().showSnackBar(context, Text('Usuário atualizado com sucesso!'));
      } else {
        Utils().showSnackBar(context, Text('Falha ao atualizar usuário!'));
      }
    } else {
      UpdateVendedorModel model = UpdateVendedorModel();
      model.vendedorId = user!.userId;
      model.vendedorNome = user!.userNome;
      model.vendedorEmail = emailController.text;
      model.vendedorCelular = celularController.text;
      model.vendedorCPF = cpfController.text;
      model.vendedorCEP = cepController.text;
      model.vendedorEndereco = addressController.text;
      model.vendedorEstadoId = selectedEstado.value;
      model.vendedorCidadeId = selectedCidade.value;
      model.vendedorLatitude = 0;
      model.vendedorLongitude = 0;

      VendedorModel? updatedModel = await api.updateVendedor(model);

      if (updatedModel != null) {
        ObjMem.currentUser = UserModel.fromJson(updatedModel.toJson(), false);
        Utils().showSnackBar(context, Text('Usuário atualizado com sucesso!'));
      } else {
        Utils().showSnackBar(context, Text('Falha ao atualizar usuário!'));
      }
    }
  }

}