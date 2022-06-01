import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/create_review_model.dart';
import 'package:viasudeste/src/models/pedido_model.dart';
import 'package:viasudeste/src/models/update_pedido_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class AvaliarBloc extends BaseBloc {

  PedidoModel? pedidoModel;

  final Api api = Api();

  final TextEditingController comentarioController = TextEditingController();
  
  final score = BehaviorSubject<double?>.seeded(null);

  void initStateScreen() {
    if (ObjMem.objetoHelp2 is PedidoModel) {
      pedidoModel = ObjMem.objetoHelp2;
    }
  }

  void disposeScreen() {
    score.close();

    disposeBaseBloc();
  }

  Future<bool> createReview(GlobalKey<FormState> formState, BuildContext context) async {
    if (formState.currentState!.validate() == true) {
      isLoading.sink.add(true);
      final _reviewModel = await api.createReview(
        CreateReviewModel(
          clienteId: ObjMem.currentUser!.userId.toString(),
          pedidoId: pedidoModel!.pedidoId.toString(),
          produtoId: pedidoModel!.pedidoProduto!.produtoId.toString(),
          reviewTitulo: "Review",
          reviewComentario: comentarioController.text.toString(),
          reviewScore: score.value,
        )
      );

      final _pedidoModel = await api.updatePedido(
        UpdatePedidoModel(
          pedidoId: pedidoModel!.pedidoId.toString(),
          produtoId: pedidoModel!.pedidoProduto!.produtoId.toString(),
          clienteId: pedidoModel!.clienteId.toString(),
          vendedorId: pedidoModel!.pedidoVendedor!.vendedorId.toString(),
          pedidoQuantidadeProduto: pedidoModel!.pedidoQuantidadeProduto,
          pedidoStatus: pedidoModel!.pedidoStatus.toString(),
          pedidoDataCompra: pedidoModel!.pedidoDataCompra.toString(),
          pedidoDataPagamento: null,
          pedidoDataTransportadora: null,
          pedidoDataPrevista: pedidoModel!.pedidoDataPrevista.toString(),
          pedidoDataEntregue: null,
          pedidoAvaliado: true,
        )
      );

      if (_reviewModel != null && _pedidoModel != null) {
        Utils().showSnackBar(context, Text("Produto avaliado com sucesso!"));
        isLoading.sink.add(false);
        return true;
      } else {
        Utils().showSnackBar(context, Text("Falha ao criar avaliação"));
        isLoading.sink.add(false);
        return false;
      }
    } else {
      Utils().showSnackBar(context, Text("Digite algum comentário para avaliar"));
      return false;
    }
  }
}