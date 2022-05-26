import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/estado_model.dart';
import 'package:viasudeste/src/models/user_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class PersonalDataBloc extends BaseBloc {

  final Api api = Api();

  UserModel? user;

  final estadosList = BehaviorSubject<List<EstadoModel>?>.seeded(null);
  final selectedEstado = BehaviorSubject<String?>.seeded(null);

  final TextEditingController emailController = TextEditingController(text: null);
  final TextEditingController celularController = TextEditingController(text: null);
  final TextEditingController cpfController = TextEditingController(text: null);
  final TextEditingController cepController = TextEditingController(text: null);
  final TextEditingController addressController = TextEditingController(text: null);

  void initStateScreen() {
    user = ObjMem.currentUser;

    getEstados();
  }

  void disposeScreen() {
    estadosList.close();
    selectedEstado.close();

    disposeBaseBloc();
  }

  void getEstados() async {
    final _list = await api.getEstados();

    if (_list != null) {
      estadosList.sink.add(_list);
    }
  }

}