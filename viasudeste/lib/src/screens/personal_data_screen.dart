import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/personal_data_bloc.dart';
import 'package:viasudeste/src/components/personal_textfield.dart';
import 'package:viasudeste/src/models/cidade_model.dart';
import 'package:viasudeste/src/models/estado_model.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late PersonalDataBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = PersonalDataBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dados Pessoais',
        ),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: Styles.mainLightGreyColor,
      ),
      body: StreamBuilder<List<EstadoModel>?>(
        stream: _bloc.estadosList.stream,
        builder: (context, snapshot) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: snapshot.hasData
              ? Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: CircleAvatar(
                            radius: 47,
                            backgroundColor: Styles.mainBlackColor,
                            child: CircleAvatar(
                              child: Text(
                                _bloc.user!.userNome == null ? '' : _bloc.user!.userNome!.substring(0, 1),
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Styles.mainBlackColor,
                                ),
                              ),
                              backgroundColor: Styles.mainWhiteColor,
                              radius: 45,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: PersonalTextField(
                            controller: _bloc.emailController,
                            formatters: [],
                            hintText: 'E-mail',
                            labelText: 'E-mail',
                            validator: (String? text) {
                              if (text != null &&
                                  text.length > 0 &&
                                  text.contains('@') &&
                                  text.contains('.')) {
                                return null;
                              } else {
                                return 'E-mail inválido.';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: PersonalTextField(
                            controller: _bloc.celularController,
                            formatters: [_bloc.maskCelular],
                            hintText: 'Celular',
                            labelText: 'Celular',
                            validator: (String? text) {
                              if (text != null && text.length > 14) {
                                return null;
                              } else {
                                return 'Celular inválido';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: PersonalTextField(
                            controller: _bloc.cpfController,
                            formatters: [_bloc.maskCPF],
                            hintText: 'CPF',
                            labelText: 'CPF',
                            validator: (String? text) {
                              if (text != null && text.length > 13) {
                                return null;
                              } else {
                                return 'CPF Inválido';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: PersonalTextField(
                            controller: _bloc.cepController,
                            formatters: [_bloc.maskCEP],
                            hintText: 'CEP',
                            labelText: 'CEP',
                            validator: (String? text) {
                              if (text != null && text.length > 8) {
                                return null;
                              } else {
                                return 'CEP Inválido';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: PersonalTextField(
                            controller: _bloc.addressController,
                            formatters: [],
                            hintText: 'Endereço',
                            labelText: 'Endereço',
                            validator: (String? text) {
                              if (text != null && text.length > 0) {
                                return null;
                              } else {
                                return 'Endereço inválido';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: StreamBuilder<List<EstadoModel>?>(
                            stream: _bloc.estadosList.stream,
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                ? DropdownButtonFormField(
                                    menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                    items: _bloc.estadosList.value!
                                      .map<DropdownMenuItem<String>>(
                                        (EstadoModel model) {
                                          return DropdownMenuItem<String>(
                                            value: model.estadoId,
                                            child: Text(model.nome.toString()),
                                          );
                                        }
                                      ).toList(),
                                    value: _bloc.selectedEstado.value,
                                    onChanged: (String? value) {
                                      _bloc.selectedEstado.sink.add(value);
                                      _bloc.cidadesList.sink.add([]);
                                      _bloc.selectedCidade.sink.add(null);
                                      _bloc.getCidades(_bloc.selectedEstado.value.toString());
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
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        borderSide: BorderSide(
                                          color: Styles.mainGreyColor,
                                        ),
                                      ),
                                      hintText: 'Escolha um estado',
                                      hintStyle: TextStyle(
                                        color: Styles.mainGreyColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Estado',
                                      labelStyle: TextStyle(
                                        color: Styles.mainGreyColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Styles.mainGreyColor,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(25))
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
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: StreamBuilder<List<CidadeModel>?>(
                            stream: _bloc.cidadesList.stream,
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                ? DropdownButtonFormField(
                                    menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                    items: _bloc.cidadesList.value!.isNotEmpty
                                      ? _bloc.cidadesList.value!
                                          .map<DropdownMenuItem<String>>(
                                            (CidadeModel model) {
                                              return DropdownMenuItem<String>(
                                                value: model.cidadeId,
                                                child: Text(model.nome.toString()),
                                              );
                                            }
                                          ).toList()
                                      : null,
                                    value: _bloc.selectedCidade.value,
                                    onChanged: (String? value) {
                                      _bloc.selectedCidade.sink.add(value);
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
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        borderSide: BorderSide(
                                          color: Styles.mainGreyColor,
                                        ),
                                      ),
                                      hintText: 'Escolha uma cidade',
                                      hintStyle: TextStyle(
                                        color: Styles.mainGreyColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Cidade',
                                      labelStyle: TextStyle(
                                        color: Styles.mainGreyColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Styles.mainGreyColor,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(25))
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
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              _bloc.updateUser(context);
                            }, 
                            child: Text(
                              'Salvar',
                              style: TextStyle(
                                fontFamily: 'Cutive Mono',
                                fontWeight: FontWeight.bold,
                                color: Styles.mainBlackColor,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Styles.mainLightPinkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              fixedSize: Size(200, 45)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Styles.mainPinkColor,
                  ),
                )
          );
        }
      ),
    );
  }
}
