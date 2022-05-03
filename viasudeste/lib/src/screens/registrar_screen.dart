import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/blocs/registrar_bloc.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/models/vendedor_model.dart';

class RegistrarScreen extends StatefulWidget {
  const RegistrarScreen({ Key? key }) : super(key: key);

  @override
  State<RegistrarScreen> createState() => _RegistrarScreenState();
}

class _RegistrarScreenState extends State<RegistrarScreen> {

  late RegistrarBloc _bloc;

  final _formState = GlobalKey<FormState>();
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = RegistrarBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldState,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  height: 100,
                  width: 200,
                  child: Image.asset(
                    'assets/images/viasudeste-logo-preto.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Crie sua conta',
                  style: TextStyle(
                    color: Styles.mainGreyColor,
                    fontSize: 28,
                    fontFamily: 'Cutive Mono',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: TextFormField(
                          controller: _bloc.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                color: Styles.mainGreyColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Styles.mainGreyColor,
                            ),
                            hintText: 'E-mail',
                            hintStyle: TextStyle(
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
                          cursorColor: Styles.mainGreyColor,
                          style: TextStyle(
                            color: Styles.mainGreyColor,
                            fontWeight: FontWeight.bold
                          ),
                          validator: (String? text) {
                            if (text != null && text.length > 0 && text.contains('@') && text.contains('.')) {
                              return null;
                            } else {
                              return 'E-mail inválido.';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _bloc.passwordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                color: Styles.mainGreyColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Styles.mainGreyColor,
                            ),
                            hintText: 'Senha',
                            hintStyle: TextStyle(
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
                          cursorColor: Styles.mainGreyColor,
                          style: TextStyle(
                            color: Styles.mainGreyColor,
                            fontWeight: FontWeight.bold
                          ),
                          obscuringCharacter: '*',
                          obscureText: true,
                          validator: (String? text) {
                            if (text == null || text.length == 0 || text.length < 8) {
                              return 'Senha inválida.';
                            } else if (text != _bloc.repeatPasswordController.text) {
                              return 'As senhas devem ser iguais.';
                            } else {
                              return null;
                            }
                          }, 
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: _bloc.repeatPasswordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                color: Styles.mainGreyColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Styles.mainGreyColor,
                            ),
                            hintText: 'Confirme a senha',
                            hintStyle: TextStyle(
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
                          cursorColor: Styles.mainGreyColor,
                          style: TextStyle(
                            color: Styles.mainGreyColor,
                            fontWeight: FontWeight.bold
                          ),
                          obscuringCharacter: '*',
                          obscureText: true,
                          validator: (String? text) {
                            if (text == null || text.length == 0 || text.length < 8) {
                              return 'Senha inválida.';
                            } else if (text != _bloc.passwordController.text) {
                              return 'As senhas devem ser iguais.';
                            } else {
                              return null;
                            }
                          }, 
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: 80,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Eu desejo ser um:',
                                  style: TextStyle(
                                    fontFamily: 'Cutive Mono',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: StreamBuilder<String?>(
                                        stream: _bloc.selectedOption.stream,
                                        builder: (context, snapshot) {
                                          return ListTile(
                                            title: Text(
                                              _bloc.accountOptions[0],
                                              style: TextStyle(
                                                color: Styles.mainBlackColor,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            leading: Radio<String>(
                                              value: _bloc.accountOptions[0],
                                              groupValue: _bloc.selectedOption.value,
                                              onChanged: (String? value) {
                                                _bloc.selectedOption.sink.add(value);
                                              },
                                              activeColor: Styles.mainBlackColor,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 0,
                                          );
                                        }
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                      child: StreamBuilder<String?>(
                                        stream: _bloc.selectedOption.stream,
                                        builder: (context, snapshot) {
                                          return ListTile(
                                            title: Text(
                                              _bloc.accountOptions[1],
                                              style: TextStyle(
                                                color: Styles.mainBlackColor,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            leading: Radio<String>(
                                              value: _bloc.accountOptions[1],
                                              groupValue: _bloc.selectedOption.value,
                                              onChanged: (String? value) {
                                                _bloc.selectedOption.sink.add(value);
                                              },
                                              activeColor: Styles.mainBlackColor,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 0,
                                          );
                                        }
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: StreamBuilder<bool?>(
                                  stream: _bloc.showError.stream,
                                  builder: (context, snapshot) {
                                    return Visibility(
                                      visible: _bloc.showError.value!,
                                      child: Text(
                                        'Esse campo é obrigatório.',
                                        style: TextStyle(
                                          fontFamily: 'Calibri',
                                          color: Colors.red.shade700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_bloc.selectedOption.value == null) {
                              _bloc.showError.sink.add(true);
                            } else {
                              _bloc.showError.sink.add(false);
                            }
        
                            if (_bloc.selectedOption.value == "Cliente") {
                              ClienteModel? model = await _bloc.createClienteAccount(_formState, _bloc.emailController.text, _bloc.passwordController.text);
        
                              if (model != null) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, 
                                  builder: (BuildContext dialogContext) {
                                    return getAccountCreatedDialog(context, dialogContext);
                                  }
                                );
                              } 
                            } else {
                              VendedorModel? model = await _bloc.createVendedorAccount(_formState, _bloc.emailController.text, _bloc.passwordController.text);
        
                              if (model != null) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, 
                                  builder: (BuildContext dialogContext) {
                                    return getAccountCreatedDialog(context, dialogContext);
                                  }
                                );
                              } 
                            }
                          }, 
                          child: StreamBuilder<bool>(
                            stream: _bloc.isLoading.stream,
                            builder: (context, snapshot) {
                              return _bloc.isLoading.value
                                ? Container(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: Styles.mainGreyColor,
                                    ),
                                )
                                : Text(
                                    'Criar',
                                    style: TextStyle(
                                      fontFamily: 'Cutive Mono',
                                      fontWeight: FontWeight.bold,
                                      color: Styles.mainBlackColor,
                                      fontSize: 16,
                                    ),
                                  );
                            }
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Styles.mainPinkColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            fixedSize: Size(200, 45)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Container(
                          width: 190,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Divider(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              Text(
                                'OU',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 172, 172, 172),
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Divider(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, 
                          child: Text(
                            'Entrar',
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Dialog getAccountCreatedDialog(BuildContext scaffoldContext, BuildContext dialogContext) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25))
    ),
    child: Container(
      width: MediaQuery.of(scaffoldContext).size.width * 0.7,
      height: MediaQuery.of(scaffoldContext).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          width: 0,
          color: Colors.transparent
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.check,
            color: Styles.mainPinkColor,
            size: 50,
          ),
          Text(
            'Sua conta foi criada com sucesso! Volte para a página de login e entre com seus dados!',
            style: TextStyle(
              fontFamily: 'Cutive Mono',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(scaffoldContext);
            }, 
            child: Text(
              'Voltar',
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
              fixedSize: Size(200, 45)
            ),
          ),
        ],
      ),
    ),
  );
}