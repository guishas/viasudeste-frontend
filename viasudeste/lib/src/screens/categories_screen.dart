import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/categories_bloc.dart';
import 'package:viasudeste/src/models/categoria_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  late CategoriesBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = CategoriesBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriaModel>?>(
      stream: _bloc.categorias.stream,
      builder: (context, snapshot) {
        return Scaffold(
          body: _bloc.categorias.value == null
            ? Center(
              child: CircularProgressIndicator(
                color: Styles.mainPinkColor,
              )
            )
            : Center(
              child: ListView.builder(
                itemCount: _bloc.categorias.value!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_bloc.categorias.value![index].categoriaNome.toString()),
                  );
                },
              )
            ),
        );
      }
    );
  }
}