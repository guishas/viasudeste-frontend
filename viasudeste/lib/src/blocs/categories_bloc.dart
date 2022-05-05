import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/src/models/categoria_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class CategoriesBloc extends BaseBloc {

  final Api api = Api();

  final categorias = BehaviorSubject<List<CategoriaModel>?>.seeded(null);
  final List<IconData> icons = [Icons.toys_outlined, Icons.phone_iphone, Icons.menu_book];

  void initStateScreen() {
    getCategorias();
  }

  void disposeScreen() {
    categorias.close();

    disposeBaseBloc();
  }

  Future<void> getCategorias() async {
    final _list = await api.getCategorias();

    if (_list != null) {
      categorias.sink.add(_list);
    }
  }
}