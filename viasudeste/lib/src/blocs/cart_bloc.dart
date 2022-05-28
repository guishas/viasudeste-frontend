import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/src/models/produto_model.dart';

class CartBloc extends BaseBloc {

  final SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final produtosList = BehaviorSubject<List<ProdutoModel>?>.seeded(null);

  void initStateScreen() {

    getProdutos();
  }

  void disposeScreen() {
    produtosList.close();

    disposeBaseBloc();
  }

  void getProdutos() async {
    final _list = await sharedPreferencesHelper.getCart();

    if (_list != null) {
      produtosList.sink.add(_list);
    }
  }
}