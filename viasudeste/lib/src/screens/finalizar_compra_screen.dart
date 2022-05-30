import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/finalizar_compra_bloc.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class FinalizarCompraScreen extends StatefulWidget {
  const FinalizarCompraScreen({ Key? key }) : super(key: key);

  @override
  State<FinalizarCompraScreen> createState() => _FinalizarCompraScreenState();
}

class _FinalizarCompraScreenState extends State<FinalizarCompraScreen> {

  late FinalizarCompraBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = FinalizarCompraBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar Compra"),
        toolbarHeight: 50,
        backgroundColor: Styles.mainLightGreyColor,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Revisar Pedido",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: StreamBuilder<List<CartProdutoModel>?>(
                  stream: _bloc.produtos.stream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _bloc.produtos.value!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          child: Card(
                            elevation: 6.0,
                            child: Row(
                              children: [
                                _bloc.produtos.value![index].produtoImagem == null
                                ? Image.asset(
                                  'assets/images/viasudeste-logo-preto.png',
                                  width: 90,
                                  height: 120,
                                  fit: BoxFit.contain,
                                )
                                : Image.network(
                                  _bloc.produtos.value![index].produtoImagem.toString(),
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
                                          _bloc.produtos.value![index].produtoNome.toString(),
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
                                          _bloc.produtos.value![index].produtoDescricao.toString(),
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
                                              _bloc.produtos.value![index].produtoPreco.toString().split(".")[1].length == 1
                                              ? "R\$ " + _bloc.produtos.value![index].produtoPreco.toString().replaceAll('.', ",") + "0"
                                              : "R\$ " + _bloc.produtos.value![index].produtoPreco.toString().replaceAll('.', ","),
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
                                  width: MediaQuery.of(context).size.width * 0.13,
                                  child: IconButton(
                                    onPressed: () async {
                                      var ret = await showDialog(
                                        context: context, 
                                        builder: (BuildContext dialogContext) {
                                          return _bloc.getConfirmItemRemoval(context, dialogContext);
                                        }
                                      );
                
                                      if (ret) {
                                        _bloc.sharedPreferencesHelper.removeItemFromCart(_bloc.produtos.value![index].produtoId.toString());
                                        _bloc.produtos.value!.removeWhere((produto) => produto.produtoId.toString() == _bloc.produtos.value![index].produtoId.toString());
                                        _bloc.produtos.sink.add(_bloc.produtos.value);
            
                                        if (_bloc.produtos.value!.length == 0) {
                                          Navigator.pop(context, true);
                                        }
                                      }
                                    }, 
                                    icon: Icon(
                                      Icons.remove_circle_outline_outlined,
                                      size: 25,
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Styles.mainLightGreyColor,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      ObjMem.objetoHelp2 = _bloc.produtos.value;

                      var ret = await Navigator.pushNamed(context, Flows.pagamento);

                      if (ret != null) {
                        ObjMem.objetoHelp2 = null;
                      }
                    }, 
                    child: Text(
                      'Finalizar',
                      style: TextStyle(
                        fontFamily: 'Cutive Mono',
                        fontWeight: FontWeight.bold,
                        color: Styles.mainBlackColor,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Styles.mainPinkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 45),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}