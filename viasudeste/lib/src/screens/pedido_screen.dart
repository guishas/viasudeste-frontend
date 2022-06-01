import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/pedido_bloc.dart';
import 'package:viasudeste/src/models/pagamento_model.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({ Key? key }) : super(key: key);

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {

  late PedidoBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = PedidoBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Styles.mainLightGreyColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<PagamentoModel?>(
          stream: _bloc.pagamentoModel.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
              ? SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Text(
                          _bloc.pedidoModel!.pedidoStatus.toString() == "Em andamento"
                          ? "Seu pedido está em andamento!"
                          : _bloc.pedidoModel!.pedidoStatus.toString() == "A caminho"
                            ? "Seu pedido está a caminho!"
                            : "Seu pedido foi entregue! Obrigado por comprar conosco.",
                          style: TextStyle(
                            fontFamily: 'Calibri',
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Center(
                            child: _bloc.pedidoModel!.pedidoStatus.toString() == "Em andamento"
                            ? Lottie.asset(
                                "assets/animations/isometric-delivery.json",
                              )
                            : _bloc.pedidoModel!.pedidoStatus.toString() == "A caminho"
                              ? Lottie.asset(
                                  "assets/animations/ongoing.json"  
                                )
                              : Icon(
                                  Icons.check_box_rounded,
                                  size: 120,
                                  color: Colors.green,
                                )
                          )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              "Produto",
                              style: TextStyle(
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _bloc.pedidoModel!.pedidoProduto!.produtoNome.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    _bloc.pedidoModel!.pedidoProduto!.produtoDescricao.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Quantidade: " + _bloc.pedidoModel!.pedidoQuantidadeProduto.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    _bloc.pedidoModel!.pedidoProduto!.produtoPreco.toString().split(".")[1].length == 1
                                    ? "R\$ " + _bloc.pedidoModel!.pedidoProduto!.produtoPreco.toString().replaceAll('.', ",") + "0"
                                    : "R\$ " + _bloc.pedidoModel!.pedidoProduto!.produtoPreco.toString().replaceAll('.', ","),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              "Enviar para",
                              style: TextStyle(
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ObjMem.currentUser!.userNome.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    _bloc.cidadeNome.value.toString() + ", " + _bloc.estadoNome.value.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    ObjMem.currentUser!.userEndereco.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    ObjMem.currentUser!.userCEP.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              "Pagamento",
                              style: TextStyle(
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _bloc.pagamentoModel.value!.pagamentoMetodo.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    "Cartão Final " + _bloc.pagamentoModel.value!.pagamentoFinalCartao.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                  Text(
                                    "ID: " + _bloc.pagamentoModel.value!.pagamentoId.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 16,
                                      color: Styles.mainLightGreyColor
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              )
              : Center(
                  child: CircularProgressIndicator(
                    color: Styles.mainPinkColor,
                  ),
                );
          }
        ),
      ),
    );
  }
}