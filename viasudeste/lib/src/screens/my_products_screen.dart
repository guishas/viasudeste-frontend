import 'package:flutter/material.dart';
import 'package:viasudeste/src/blocs/my_products_bloc.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({ Key? key }) : super(key: key);

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {

  late MyProductsBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = MyProductsBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}