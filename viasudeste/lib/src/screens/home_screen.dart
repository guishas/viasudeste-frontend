import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/login_helper.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'HOME' + ObjMem.currentUser.toString(),
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