import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class PagarBloc extends BaseBloc {

  List<CartProdutoModel>? produtos;

  void initStateScreen() {
    if (ObjMem.objetoHelp2 is List<CartProdutoModel>) {
      produtos = ObjMem.objetoHelp2;
    }
  }

  void disposeScreen() {

    disposeBaseBloc();
  }

  String getTotal() {
    double soma = 0;

    for (CartProdutoModel model in produtos ?? []) {
      soma += model.produtoPreco ?? 0;
    }

    return soma.toString();
  }
}