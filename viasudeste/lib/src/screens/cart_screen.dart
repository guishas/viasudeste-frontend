import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/cart_bloc.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late CartBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = CartBloc();
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
          'Meu Carrinho',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<CartProdutoModel>?>(
        stream: _bloc.produtosList.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? _bloc.produtosList.value!.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _bloc.produtosList.value!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                ObjMem.objetoHelp1 = ProdutoModel.fromJson(_bloc.produtosList.value![index].toJson());

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
                                      _bloc.produtosList.value![index].produtoImagem == null
                                      ? Image.asset(
                                        'assets/images/viasudeste-logo-preto.png',
                                        width: 90,
                                        height: 120,
                                        fit: BoxFit.contain,
                                      )
                                      : Image.network(
                                        _bloc.produtosList.value![index].produtoImagem.toString(),
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
                                                _bloc.produtosList.value![index].produtoNome.toString(),
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
                                                _bloc.produtosList.value![index].produtoDescricao.toString(),
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
                                                    _bloc.produtosList.value![index].produtoPreco.toString().split(".")[1].length == 1
                                                    ? "R\$ " + _bloc.produtosList.value![index].produtoPreco.toString().replaceAll('.', ",") + "0"
                                                    : "R\$ " + _bloc.produtosList.value![index].produtoPreco.toString().replaceAll('.', ","),
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
                                              _bloc.removeItemFromCart(_bloc.produtosList.value![index].produtoId.toString(), context);
                                            }
                                          },
                                          icon: Icon(Icons.delete_outlined)
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
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            var ret = await showDialog(
                              barrierDismissible: false,
                              context: context, 
                              builder: (BuildContext dialogContext) {
                                return _bloc.getComfirmEmptyCart(context, dialogContext);
                              }
                            );
                            
                            if ((ret as bool) == true) {
                              _bloc.emptyCart();
                            }
                          }, 
                          child: Text(
                            'Esvaziar Carrinho',
                            style: TextStyle(
                              fontFamily: 'Cutive Mono',
                              fontWeight: FontWeight.bold,
                              color: Styles.mainBlackColor,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Styles.mainLightPinkColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 45),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'Seu carrinho está vazio!',
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