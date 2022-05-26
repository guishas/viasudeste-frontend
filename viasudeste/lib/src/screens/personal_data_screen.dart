import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/personal_data_bloc.dart';
import 'package:viasudeste/src/components/my_form_textfield.dart';
import 'package:viasudeste/src/components/personal_textfield.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: PersonalTextField(
                  controller: _bloc.emailController,
                  hintText: 'E-mail',
                  labelText: 'E-mail',
                  icon: Icons.mail_outline,
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
                  hintText: 'Celular (##) #####-####',
                  labelText: 'Celular',
                  icon: Icons.phone,
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
                  hintText: 'CPF',
                  labelText: 'CPF',
                  icon: Icons.document_scanner,
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
                  hintText: 'CEP',
                  labelText: 'CEP',
                  icon: Icons.house_siding_outlined,
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
                  hintText: 'Endereço',
                  labelText: 'Endereço',
                  icon: Icons.house_outlined,
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
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Styles.mainGreyColor,
                            ),
                            hintText: 'Estado',
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
            ],
          ),
        ),
      ),
    );
  }
}
