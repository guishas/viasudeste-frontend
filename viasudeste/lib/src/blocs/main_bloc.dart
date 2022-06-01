import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/produto_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class MainBloc extends BaseBloc {

  final Api api = Api();

  final produtosList = BehaviorSubject<List<ProdutoModel>?>.seeded(null);

  List<ProdutoModel>? baseList = [];

  TextEditingController searchController = new TextEditingController();

  String? categoriaId;
  bool? shouldUpdate;

  void initStateScreen() {
    if (ObjMem.shouldUpdateCategory is bool) {
      shouldUpdate = ObjMem.shouldUpdateCategory;
    }

    if (ObjMem.objetoCategoriaId is String) {
      categoriaId = ObjMem.objetoCategoriaId;
    }

    getProdutos();
  }

  void disposeScreen() {
    produtosList.close();

    disposeBaseBloc();
  }

  void getProdutos() async {
    final _list = await api.getProdutos();

    if (_list != null) {
      produtosList.sink.add(_list);
      baseList = _list;
    }

    if (shouldUpdate == true) {
      List<ProdutoModel> list = [];

      for (ProdutoModel produtoModel in produtosList.value ?? []) {
        if (produtoModel.produtoCategoria!.categoriaId.toString() == categoriaId.toString()) {
          list.add(produtoModel);
        }
      }

      produtosList.sink.add(list);

      shouldUpdate = false;
      ObjMem.shouldUpdateCategory = false;
    }
  }

  void searchString(String string) {
    if (string == "") {
      produtosList.sink.add(baseList);
      return;
    }

    List<ProdutoModel> list = [];

    for (ProdutoModel produtoModel in produtosList.value ?? []) {
      if (removeDiacritics(produtoModel.produtoNome.toString().toLowerCase()).contains(removeDiacritics(string.toLowerCase()))) {
        list.add(produtoModel);
      }
    }

    produtosList.sink.add(list);
  }

  String removeDiacritics(String str) {

    var withDia = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz'; 

    for (int i = 0; i < withDia.length; i++) {      
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }

    return str;

  }
}