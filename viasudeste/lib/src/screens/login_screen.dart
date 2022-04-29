import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = LoginBloc();
    _bloc.configContext(this.context, _scaffoldState);
    _bloc.initStateScreen();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainWhiteColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
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
            // Padding(
            //   padding: EdgeInsets.only(top: 30),
            //   child: Text(
            //     'Entrar',
            //     style: TextStyle(
            //       color: Styles.mainGreyColor,
            //       fontSize: 46,
            //       fontFamily: 'Cutive Mono',
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(
                              color: Styles.mainGreyColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
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
                          )
                        ),
                        style: TextStyle(
                          color: Styles.mainGreyColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(
                              color: Styles.mainGreyColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_rounded,
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
                          )
                        ),
                        style: TextStyle(
                          color: Styles.mainGreyColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StreamBuilder<bool>(
                              stream: _bloc.rememberMe.stream,
                              builder: (context, snapshot) {
                                return Checkbox(
                                  value: _bloc.rememberMe.value, 
                                  onChanged: (bool? value) {
                                    _bloc.rememberMe.sink.add(value!);
                                  },
                                  activeColor: Styles.mainBlackColor,
                                );
                              }
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Lembrar',
                              style: TextStyle(
                                fontFamily: 'Cutive Mono',
                                fontWeight: FontWeight.bold,
                                color: Styles.mainBlackColor,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Abrir link
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                fontFamily: 'Cutive Mono',
                                fontWeight: FontWeight.bold,
                                color: Styles.mainBlackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {

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
                        primary: Styles.mainPinkColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        fixedSize: Size(200, 45)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {

                      }, 
                      child: Text(
                        'Cadastrar',
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
            )
          ],
        ),
      )
    );
  }
}