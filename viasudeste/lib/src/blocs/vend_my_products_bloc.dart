import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/produto_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class VendedorMeusProdutosBloc extends BaseBloc {

  final Api api = Api();

  final produtosList = BehaviorSubject<List<ProdutoModel>?>.seeded(null);

  void initStateScreen() {

    getProdutos();
  }

  void disposeScreen() {
    produtosList.close();

    disposeBaseBloc();
  }

  void getProdutos() async {
    final _list = await api.getProdutosByVendedorId(ObjMem.currentUser!.userId.toString());

    if (_list != null) {
      produtosList.sink.add(_list);
    }
  }
}