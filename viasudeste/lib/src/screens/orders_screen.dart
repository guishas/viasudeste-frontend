import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/orders_bloc.dart';
import 'package:viasudeste/src/models/pedido_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({ Key? key }) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  late OrdersBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = OrdersBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text('Meus Pedidos'),
        centerTitle: true,
        backgroundColor: Styles.mainLightGreyColor,
      ),
      body: StreamBuilder<List<PedidoModel>?>(
        stream: _bloc.pedidosList.stream,
        builder: (context, snapshot) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: snapshot.hasData
              ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _bloc.pedidosList.value!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              ObjMem.objetoHelp1 = _bloc.pedidosList.value![index];

                              var ret = await Navigator.pushNamed(context, Flows.pedido);

                              if (ret != null) {
                                ObjMem.objetoHelp1 = null;
                              }
                            },
                            child: Container(
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            _bloc.pedidosList.value![index].pedidoProduto!.produtoNome.toString(),
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              color: Styles.mainGreyColor,
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            _bloc.getDateByISOString(_bloc.pedidosList.value![index].pedidoDataCompra.toString()),
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              color: Styles.mainLightGreyColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ID Pedido: ",
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              color: Styles.mainBlackColor,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            _bloc.pedidosList.value![index].pedidoId.toString(),
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              color: Styles.mainLightGreyColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Quantidade: ",
                                                style: TextStyle(
                                                  fontFamily: 'Calibri',
                                                  color: Styles.mainBlackColor,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                _bloc.pedidosList.value![index].pedidoQuantidadeProduto.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Calibri',
                                                  color: Styles.mainLightGreyColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Preço Total: ",
                                                style: TextStyle(
                                                  fontFamily: 'Calibri',
                                                  color: Styles.mainBlackColor,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                _bloc.pedidosList.value![index].pedidoProduto!.produtoPreco.toString().split(".")[1].length == 1
                                                ? "R\$ " + _bloc.pedidosList.value![index].pedidoProduto!.produtoPreco.toString().replaceAll('.', ",") + "0"
                                                : "R\$ " + _bloc.pedidosList.value![index].pedidoProduto!.produtoPreco.toString().replaceAll('.', ","),
                                                style: TextStyle(
                                                  fontFamily: 'Calibri',
                                                  color: Styles.mainLightGreyColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            _bloc.pedidosList.value![index].pedidoStatus.toString(),
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              color: _bloc.pedidosList.value![index].pedidoStatus.toString() == "Em andamento"
                                              ? Colors.orange.shade400
                                              : _bloc.pedidosList.value![index].pedidoStatus.toString() == "A caminho"
                                                ? Colors.blue
                                                : Colors.green,
                                              fontSize: 16,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
              : Center(
                  child: CircularProgressIndicator(
                    color: Styles.mainPinkColor,
                  ),
                ),
          );
        }
      ),
    );
  }
}