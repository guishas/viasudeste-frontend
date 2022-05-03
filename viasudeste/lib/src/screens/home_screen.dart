import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/login_helper.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late HomeBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = HomeBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainLightGreyColor,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Styles.mainWhiteColor,
          ),
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Center(
            child: TextField(
              controller: _bloc.searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide.none
                ),
                hintText: 'Buscar',
                hintStyle: TextStyle(
                  fontFamily: 'Cutive Mono',
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Styles.mainPinkColor,
                ),
                contentPadding: EdgeInsets.zero
              ),
              onSubmitted: (String? value) {
                print(value);
              },
              cursorColor: Styles.mainBlackColor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ],
      ),
    );
  }
}