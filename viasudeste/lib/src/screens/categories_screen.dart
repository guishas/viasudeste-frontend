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
          appBar: AppBar(
            backgroundColor: Styles.mainLightGreyColor,
            title: Text(
              'Categorias',
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: _bloc.categorias.value == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Styles.mainPinkColor,
                )
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2,
                ),
                itemCount: _bloc.categorias.value!.length,
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
                          _bloc.icons[index],
                          size: 50,
                          color: Styles.mainPinkColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            _bloc.categorias.value![index].categoriaNome.toString(),
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
    );
  }
}