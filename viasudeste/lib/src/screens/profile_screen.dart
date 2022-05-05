import 'package:flutter/material.dart';
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190,
          childAspectRatio: 2 / 2,
        ), 
        itemCount: _bloc.items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Styles.mainLightGreyColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _bloc.items[index].iconData,
                  size: 50,
                  color: Styles.mainPinkColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    _bloc.items[index].name.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Cutive Mono',
                      fontWeight: FontWeight.bold,
                      color: Styles.mainPinkColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}