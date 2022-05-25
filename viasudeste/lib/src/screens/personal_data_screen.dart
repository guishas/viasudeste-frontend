import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/personal_data_bloc.dart';
import 'package:viasudeste/src/components/my_form_textfield.dart';
import 'package:viasudeste/src/components/personal_textfield.dart';

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
                  icon: Icons.document_scanner,
                  validator: (String? text) {
                    if (text != null && text.length > 13) {
                      return null;
                    } else {
                      return 'CPF Inválido';
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
