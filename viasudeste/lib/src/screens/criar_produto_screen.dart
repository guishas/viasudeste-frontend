import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/criar_produto_bloc.dart';
import 'package:viasudeste/src/components/create_product_textfield.dart';
import 'package:viasudeste/src/models/categoria_model.dart';

class CriarProdutoScreen extends StatefulWidget {
  const CriarProdutoScreen({ Key? key }) : super(key: key);

  @override
  State<CriarProdutoScreen> createState() => _CriarProdutoScreenState();
}

class _CriarProdutoScreenState extends State<CriarProdutoScreen> {

  late CriarProdutoBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _formState = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = CriarProdutoBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text("Criar produto"),
        centerTitle: true,
        backgroundColor: Styles.mainLightGreyColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formState,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: StreamBuilder<File?>(
                        stream: _bloc.imageFile.stream,
                        builder: (context, snapshot) {
                          return GestureDetector(
                            onTap: () {
                              _bloc.pickImage();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: _bloc.imageFile.value == null
                                ? Icon(
                                    Icons.camera_alt,
                                    size: 34,
                                  )
                                : Image.file(_bloc.imageFile.value!),
                              decoration: BoxDecoration(
                                color: _bloc.imageFile.value == null
                                  ? Styles.mainLightGreyColor
                                  : Styles.mainWhiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                            ),
                          );
                        }
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: CreateProductTextField(
                        controller: _bloc.nomeController,
                        hintText: "Nome",
                        labelText: "Nome",
                        formatters: [],
                        validator: (String? value) {
                          if (value != null && value.length > 0) {
                            return null;
                          } else {
                            return 'Nome inválido';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        child: CreateProductTextField(
                          controller: _bloc.descricaoController,
                          maxLines: 5,
                          hintText: "",
                          labelText: "Descrição",
                          formatters: [],
                          validator: (String? value) {
                            if (value != null && value.length > 0) {
                              return null;
                            } else {
                              return 'Descrição inválida';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: StreamBuilder<List<CategoriaModel>?>(
                        stream: _bloc.categoriasList.stream,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                            ? DropdownButtonFormField(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                items: _bloc.categoriasList.value!
                                  .map<DropdownMenuItem<String>>(
                                    (CategoriaModel model) {
                                      return DropdownMenuItem<String>(
                                        value: model.categoriaId,
                                        child: Text(model.categoriaNome.toString()),
                                      );
                                    }
                                  ).toList(),
                                value: _bloc.selectedCategoria.value,
                                onChanged: (String? value) {
                                  _bloc.selectedCategoria.sink.add(value);
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                },
                                style: TextStyle(
                                  color: Styles.mainGreyColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cutive Mono',
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Styles.mainGreyColor,
                                    ),
                                  ),
                                  hintText: 'Escolha uma categoria',
                                  hintStyle: TextStyle(
                                    color: Styles.mainGreyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  labelText: 'Categoria',
                                  labelStyle: TextStyle(
                                    color: Styles.mainGreyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Styles.mainGreyColor,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  errorStyle: TextStyle(
                                    fontFamily: 'Calibri',
                                  )
                                ),
                              )
                            : SizedBox();
                        }
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: CreateProductTextField(
                              controller: _bloc.precoController,
                              hintText: "Preço",
                              labelText: "Preço",
                              formatters: [],
                              validator: (String? value) {
                                if (value != null && value.length > 0) {
                                  return null;
                                } else {
                                  return 'Preço inválido';
                                }
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: CreateProductTextField(
                              controller: _bloc.quantidadeController,
                              hintText: "Quantidade",
                              labelText: "Quantidade",
                              formatters: [],
                              validator: (String? value) {
                                if (value != null && value.length > 0) {
                                  return null;
                                } else {
                                  return 'Quantidade inválida';
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: StreamBuilder<bool>(
                        stream: _bloc.isLoading.stream,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            onPressed: () async {
                              _bloc.createProduto(_formState, context);
                            }, 
                            child: _bloc.isLoading.value
                              ? Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: Styles.mainWhiteColor,
                                )
                              )
                              : Text(
                                'Criar',
                                style: TextStyle(
                                  fontFamily: 'Cutive Mono',
                                  fontWeight: FontWeight.bold,
                                  color: Styles.mainBlackColor,
                                  fontSize: 16,
                                ),
                              ),
                            style: ElevatedButton.styleFrom(
                              primary: Styles.mainPinkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 45),
                            ),
                          );
                        }
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}