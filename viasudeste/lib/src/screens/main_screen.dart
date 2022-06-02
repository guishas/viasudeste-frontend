import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
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
                _bloc.searchString(value.toString());
              },
              onChanged: (String? string) {
                if (string == "") {
                  _bloc.searchString("");
                }
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
            ? _bloc.produtosList.value!.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: _bloc.produtosList.value!.length,
                  itemBuilder: (gridContext, index) {
                    return GestureDetector(
                      onTap: () async {
                        ObjMem.objetoHelp1 = _bloc.produtosList.value![index];

                        var ret = await Navigator.pushNamed(context, Flows.produto);

                        if (ret != null) {
                          ObjMem.objetoHelp1 = null;
                        }
                      },
                      child: Card(
                        color: Styles.mainWhiteColor,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Container(
                                width: double.infinity,
                                height: 120,
                                child: _bloc.produtosList.value![index].produtoImagem == null
                                  ? Image.asset(
                                    'assets/images/viasudeste-logo-preto.png',
                                    fit: BoxFit.contain,
                                  )
                                  :  Image.asset(
                                    'assets/images/viasudeste-logo-preto.png',
                                    fit: BoxFit.contain,
                                  ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                                child: Text(
                                  _bloc.produtosList.value![index].produtoNome.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 15, right: 10, bottom: 10),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      _bloc.produtosList.value![index].produtoPreco.toString().split(".")[1].length == 1
                                      ? "R\$ " + _bloc.produtosList.value![index].produtoPreco.toString().replaceAll('.', ",") + "0"
                                      : "R\$ " + _bloc.produtosList.value![index].produtoPreco.toString().replaceAll('.', ","),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Calibri'
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Não existe nenhum produto no momento! Volte mais tarde",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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