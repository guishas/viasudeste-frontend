import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/main_bloc.dart';
import 'package:viasudeste/src/models/produto_model.dart';

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
      body: StreamBuilder<List<ProdutoModel>?>(
        stream: _bloc.produtosList.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: _bloc.produtosList.value!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Styles.mainWhiteColor,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                      ],
                    ),
                  );
                }
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Styles.mainPinkColor,
                ),
              );
        }
      ),
    );
  }
}