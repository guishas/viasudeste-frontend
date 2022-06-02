import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/categoria_model.dart';
import 'package:viasudeste/src/models/create_produto_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class CriarProdutoBloc extends BaseBloc {

  final Api api = Api();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  final imageFile = BehaviorSubject<File?>.seeded(null);

  final categoriasList = BehaviorSubject<List<CategoriaModel>?>.seeded(null);
  final selectedCategoria = BehaviorSubject<String?>.seeded(null);
  
  void initStateScreen() {

    getCategorias();
  }

  void disposeScreen() {
    imageFile.close();
    categoriasList.close();
    selectedCategoria.close();
    
    disposeBaseBloc();
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageF = File(image.path);
      imageFile.sink.add(imageF);
    }
  }

  void getCategorias() async {
    final _list = await api.getCategorias();

    if (_list != null) {
      categoriasList.sink.add(_list);
    }
  }

  Future<bool> createProduto(GlobalKey<FormState> formState, BuildContext context) async {
    if (formState.currentState!.validate() && imageFile.value != null && selectedCategoria.value != null) {
      isLoading.sink.add(true);
      CreateProdutoModel model = CreateProdutoModel(
        produtoNome: nomeController.text.toString(),
        produtoDescricao: descricaoController.text.toString(),
        produtoCategoriaId: selectedCategoria.value.toString(),
        produtoVendedorId: ObjMem.currentUser!.userId.toString(),
        produtoPreco: double.tryParse(precoController.text.toString()),
        produtoQuantidade: int.tryParse(quantidadeController.text.toString())
      );

      final produtoModel = await api.createProduto(model);
      print(produtoModel);

      if (produtoModel != null) {
        final mediaModel = await api.createMedia(imageFile.value!, produtoModel.produtoId.toString());

        if (mediaModel != null) {
          Utils().showSnackBar(context, Text("Produto criado com sucesso!"));
          isLoading.sink.add(false);
          return true;
        } else {
          Utils().showSnackBar(context, Text("Falha ao criar produto"));
          isLoading.sink.add(false);
          return false;
        } 
      } else {
        return false;
      }
    } else {
      Utils().showSnackBar(context, Text("Verifique os campos."));
      isLoading.sink.add(false);
      return false;
    }
  }
}