import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/finalizar_compra_bloc.dart';
import 'package:viasudeste/src/components/payment_textfield.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class FinalizarCompraScreen extends StatefulWidget {
  const FinalizarCompraScreen({ Key? key }) : super(key: key);

  @override
  State<FinalizarCompraScreen> createState() => _FinalizarCompraScreenState();
}

class _FinalizarCompraScreenState extends State<FinalizarCompraScreen> {

  late FinalizarCompraBloc _bloc;

  final _formState = GlobalKey<FormState>();
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Resumo do Pedido",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Produtos",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            _bloc.produtos.value!.length == 1
                            ? _bloc.produtos.value!.length.toString() + " item"
                            : _bloc.produtos.value!.length.toString() + " itens",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              color: Styles.mainLightGreyColor,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "Total",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainLightGreyColor
                                      ),
                                    ),
                                    Text(
                                      _bloc.getTotal().split(".")[1].length == 1
                                      ? "R\$ " + _bloc.getTotal().replaceAll('.', ",") + "0"
                                      : "R\$ " + _bloc.getTotal().replaceAll('.', ","),
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainLightGreyColor
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Taxas",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainLightGreyColor
                                      ),
                                    ),
                                    Text(
                                      "R\$ 0,00",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainLightGreyColor
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Frete",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainLightGreyColor
                                      ),
                                    ),
                                    Text(
                                      "R\$ 0,00",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainLightGreyColor
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainBlackColor,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      _bloc.getTotal().split(".")[1].length == 1
                                      ? "R\$ " + _bloc.getTotal().replaceAll('.', ",") + "0"
                                      : "R\$ " + _bloc.getTotal().replaceAll('.', ","),
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontSize: 16,
                                        color: Styles.mainBlackColor,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
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
                            "Entregar para",
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
                            "Informações de pagamento",
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
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                          key: _formState,
                          child: Column(
                            children: [
                              Container(
                                child: PaymentTextField(
                                  validator: (String? value) {
                                    if (value != null && value.length > 0) {
                                      return null;
                                    } else {
                                      return 'Nome inválido';
                                    }
                                  },
                                  controller: _bloc.nomeController, 
                                  labelText: "Nome no cartão", 
                                  formatters: []
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
                                  child: PaymentTextField(
                                    validator: (String? value) {
                                      if (value != null && value.length > 18) {
                                        return null;
                                      } else {
                                        return 'Número inválido';
                                      }
                                    },
                                    controller: _bloc.numeroController, 
                                    labelText: "Número do cartão", 
                                    formatters: [_bloc.maskNumeroCartao]
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: PaymentTextField(
                                        validator: (String? value) {
                                          if (value != null && value.length > 4) {
                                            return null;
                                          } else {
                                            return 'Data inválida';
                                          }
                                        },
                                        controller: _bloc.dataController, 
                                        labelText: "Validade", 
                                        formatters: [_bloc.maskData]
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: PaymentTextField(
                                        validator: (String? value) {
                                          if (value != null && value.length > 2) {
                                            return null;
                                          } else {
                                            return 'CVV';
                                          }
                                        },
                                        controller: _bloc.cvvController, 
                                        labelText: "CVV", 
                                        formatters: [_bloc.maskCVV]
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
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
                      child: StreamBuilder<bool>(
                        stream: _bloc.isLoading.stream,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            onPressed: () async {
                              var ret = await _bloc.addAllItems(_formState, context);

                              if (ret) {
                                await showDialog(
                                  context: context, 
                                  builder: (BuildContext dialogContext) {
                                    return _bloc.getConfirmItemRemoval(context, dialogContext);
                                  }
                                );

                                Navigator.pop(context, true);
                              }
                            }, 
                            child: _bloc.isLoading.value
                              ? Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: Styles.mainWhiteColor,
                                )
                              )
                              : Text(
                                'Comprar',
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
                          );
                        }
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}