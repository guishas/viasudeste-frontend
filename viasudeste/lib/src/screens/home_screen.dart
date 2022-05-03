import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/login_helper.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/components/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Styles.mainPinkColor,
                  Styles.mainLightPinkColor,
                ]
              )
            ),
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Styles.mainWhiteColor,
                    size: 24,
                  ),
                  title: Text(
                    'Perfil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Styles.mainWhiteColor
                    ),
                  ),
                  horizontalTitleGap: 0,
                )
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOME ' + ObjMem.currentUser!.userId.toString() + ' ' + ObjMem.currentUser!.userNome.toString(),
            ),
            ElevatedButton(
              onPressed: () async {
                LoginHelper loginhelper = LoginHelper();
                await loginhelper.logoutUser();
                Navigator.pushReplacementNamed(context, Flows.login);
              }, 
              child: Text('sair')
            ),
          ],
        ),
      ),
    );
  }
}