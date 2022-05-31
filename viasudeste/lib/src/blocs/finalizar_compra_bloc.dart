import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';
import 'package:viasudeste/src/models/create_pagamento_model.dart';
import 'package:viasudeste/src/models/create_pedido_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class FinalizarCompraBloc extends BaseBloc {

  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final Api api = Api();

  final produtos = BehaviorSubject<List<CartProdutoModel>?>.seeded(null);

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  var maskNumeroCartao = MaskTextInputFormatter(
    mask: "#### #### #### ####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  var maskData = MaskTextInputFormatter(
    mask: "##/##",
    filter: {"#": RegExp(r'[0-9]')},
  );

  var maskCVV = MaskTextInputFormatter(
    mask: "###",
    filter: {"#": RegExp(r'[0-9]')},
  );

  void initStateScreen() {
    if (ObjMem.objetoHelp1 is List<CartProdutoModel>) {
      produtos.sink.add(ObjMem.objetoHelp1);
    }

  }

  void disposeScreen() {
    produtos.close();

    disposeBaseBloc();
  }

  String getTotal() {
    double soma = 0;

    for (CartProdutoModel model in produtos.value ?? []) {
      soma += model.produtoPreco ?? 0;
    }

    return soma.toString();
  }

  Future<bool> addAllItems(GlobalKey<FormState> formState, BuildContext context) async {
    if (formState.currentState!.validate() == true) {
      isLoading.sink.add(true);

      for (CartProdutoModel model in produtos.value ?? []) {
        CreatePedidoModel pModel = CreatePedidoModel(
          clienteId: ObjMem.currentUser!.userId.toString(),
          produtoId: model.produtoId.toString(),
          vendedorId: model.produtoVendedor!.vendedorId.toString(),
          pedidoQuantidadeProduto: 1,
          pedidoStatus: "Em andamento",
          pedidoDataCompra: DateTime.now().toIso8601String(),
          pedidoDataPagamento: null,
          pedidoDataTransportadora: null,
          pedidoDataPrevista: DateTime.now().toIso8601String(),
          pedidoDataEntregue: null,
          pedidoAvaliado: false
        );

        String? pedidoId = await api.adicionarPedido(pModel);

        CreatePagamentoModel pagModel = CreatePagamentoModel(
          clienteId: ObjMem.currentUser!.userId.toString(),
          pedidoId: pedidoId.toString(),
          pagamentoMetodo: "Cartão de Crédito",
          pagamentoParcelas: 1,
          pagamentoValorTotal: double.tryParse(getTotal()),
          pagamentoFinalCartao: int.tryParse(numeroController.text.substring(15))
        );

        await api.adicionarPagamento(pagModel);
      }

      isLoading.sink.add(false);
      Utils().showSnackBar(context, Text('Pedido(s) feito(s) com sucesso!'));
      return true;
    } else {
      Utils().showSnackBar(context, Text('Verifique os campos'));
      return false;
    }
  }

  Dialog getConfirmItemRemoval(BuildContext scaffoldContext, BuildContext dialogContext) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: Container(
        width: MediaQuery.of(scaffoldContext).size.width * 0.7,
        height: MediaQuery.of(scaffoldContext).size.height * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            width: 0,
            color: Colors.transparent
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.check,
              size: 40,
            ),
            Text(
              'Seus pedidos foram efetuados com sucesso! Volte para seu perfil para visualizar seus pedidos',
              style: TextStyle(
                fontFamily: 'Cutive Mono',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              }, 
              child: Text(
                'Voltar',
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
                fixedSize: Size(200, 45)
              ),
            ),
          ],
        ),
      ),
    );
  }
}