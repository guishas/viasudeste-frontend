import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/blocs/wishlist_bloc.dart';
import 'package:viasudeste/src/models/produto_model.dart';
import 'package:viasudeste/src/models/wishlist_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({ Key? key }) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  late WishlistBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = WishlistBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainLightGreyColor,
        title: Text(
          'Lista de Desejos',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<WishlistModel>?>(
        stream: _bloc.wishlistList.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
            ? _bloc.wishlistList.value!.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _bloc.wishlistList.value!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              ObjMem.objetoHelp1 = ProdutoModel.fromJson(_bloc.wishlistList.value![index].toJson());

                              var ret = await Navigator.pushNamed(context, Flows.produto);

                              if (ret != null) {
                                ObjMem.objetoHelp1 = null;
                              }
                            },
                            child: Container(
                              height: 120,
                              child: Card(
                                elevation: 6.0,
                                child: Row(
                                  children: [
                                    _bloc.wishlistList.value![index].produtoImagem == null
                                    ? Image.asset(
                                      'assets/images/viasudeste-logo-preto.png',
                                      width: 90,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    )
                                    : Image.network(
                                      _bloc.wishlistList.value![index].produtoImagem.toString(),
                                      width: 60,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              _bloc.wishlistList.value![index].produtoNome.toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              _bloc.wishlistList.value![index].produtoDescricao.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _bloc.wishlistList.value![index].produtoPreco.toString().split(".")[1].length == 1
                                                  ? "R\$ " + _bloc.wishlistList.value![index].produtoPreco.toString().replaceAll('.', ",") + "0"
                                                  : "R\$ " + _bloc.wishlistList.value![index].produtoPreco.toString().replaceAll('.', ","),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.1,
                                      child: IconButton(
                                        onPressed: () async {
                                          var ret = await showDialog(
                                            barrierDismissible: false,
                                            context: context, 
                                            builder: (BuildContext dialogContext) {
                                              return _bloc.getConfirmItemRemoval(context, dialogContext);
                                            }
                                          );
                                          
                                          if (ret) {
                                            var ret = await _bloc.deleteWishlist(_bloc.wishlistList.value![index].wishlistId.toString());
                                            if (ret) {
                                              Utils().showSnackBar(context, Text('Produto removido com sucesso'));
                                              _bloc.wishlistList.value!.removeWhere((model) => model.wishlistId.toString() == _bloc.wishlistList.value![index].wishlistId.toString());
                                              _bloc.wishlistList.sink.add(_bloc.wishlistList.value);
                                            } else {
                                              Utils().showSnackBar(context, Text('Falha ao remover o produto'));
                                            }
                                          }
                                        },
                                        icon: Icon(Icons.heart_broken_outlined)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'Você não possui itens na sua lista de desejos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
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