import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late ProfileBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = ProfileBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainLightGreyColor,
        title: Text(
          'Perfil',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Styles.mainLightPinkColor,
              Styles.mainWhiteColor,
            ],
          )
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ObjMem.currentUser!.userNome.toString(),
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: Styles.mainLightGreyColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      ObjMem.currentUser!.userEmail.toString(),
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontSize: 16,
                        color: Styles.mainLightGreyColor,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    size: 20,
                    color: Styles.mainLightGreyColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      ObjMem.currentUser!.userCelular == null ? 'Faltando informação' : ObjMem.currentUser!.userCelular.toString(),
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontSize: 16,
                        color: Styles.mainLightGreyColor,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Divider(
                  height: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Flows.personal);
                  }, 
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color: Styles.mainPinkColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Dados Pessoais',
                                style: TextStyle(
                                  color: Styles.mainLightGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        color: Styles.mainLightGreyColor,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 40),
                    primary: Styles.mainWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Flows.pedidos);
                  }, 
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.list_alt_rounded,
                              color: Styles.mainPinkColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Meus Pedidos',
                                style: TextStyle(
                                  color: Styles.mainLightGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        color: Styles.mainLightGreyColor,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 40),
                    primary: Styles.mainWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Flows.avaliacoes);
                  }, 
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.rate_review_outlined,
                              color: Styles.mainPinkColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Minhas Avaliações',
                                style: TextStyle(
                                  color: Styles.mainLightGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        color: Styles.mainLightGreyColor,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 40),
                    primary: Styles.mainWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _bloc.sharedPreferencesHelper.logoutUser();
                    Navigator.pushReplacementNamed(context, Flows.login);
                  }, 
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.exit_to_app_outlined,
                              color: Styles.mainPinkColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Sair',
                                style: TextStyle(
                                  color: Styles.mainLightGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        color: Styles.mainLightGreyColor,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 40),
                    primary: Styles.mainWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}