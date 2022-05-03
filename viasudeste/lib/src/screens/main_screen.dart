import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late MainBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = MainBloc();
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
        child: Text('MAIN'),
      ),
    );
  }
}