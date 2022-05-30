import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/library/utilities/utils.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';
import 'package:viasudeste/src/models/review_model.dart';
import 'package:viasudeste/src/models/wishlist_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class ProdutoBloc extends BaseBloc {

  final SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final isLoadingCart = BehaviorSubject<bool>.seeded(false);
  final reviewsList = BehaviorSubject<List<ReviewModel>?>.seeded(null);

  final Api api = Api();

  ProdutoModel? model;

  void initStateScreen() {
    if (ObjMem.objetoHelp1 is ProdutoModel) {
      model = ObjMem.objetoHelp1;
    }

    getProductReviews();
  }

  void disposeScreen() {
    isLoadingCart.close();
    reviewsList.close();

    disposeBaseBloc();
  }

  void addProductToCart(BuildContext context) async {
    isLoadingCart.sink.add(true);
    bool ret = await sharedPreferencesHelper.addItemToCart(CartProdutoModel.fromJson(model!.toJson()));

    if (ret) {
      isLoadingCart.sink.add(false);
      Utils().showSnackBar(context, Text('Produto adicionado com sucesso!'));
    } else {
      isLoadingCart.sink.add(false);
      Utils().showSnackBar(context, Text('Esse produto já está no carrinho!'));
    }
  }

  void addProductToWishlist(BuildContext context) async {
    isLoading.sink.add(true);
    final _list = await api.getWishlistByUserId(ObjMem.currentUser!.userId.toString());

    if (_list != null) {
      for (WishlistModel wishlist in _list) {
        if (wishlist.produtoId.toString() == model!.produtoId.toString()) {
          isLoading.sink.add(false);
          Utils().showSnackBar(context, Text('Esse produto já está na sua lista'));
          return;
        }
      }

      bool _ret = await api.addWishlist(ObjMem.currentUser!.userId.toString(), model!.produtoId.toString());

      if (_ret) {
        isLoading.sink.add(false);
        Utils().showSnackBar(context, Text('Produto adicionado com sucesso!'));
        return;
      } else {
        isLoading.sink.add(false);
        Utils().showSnackBar(context, Text('Não foi possível adicionar o produto!'));
        return;
      }
    }
  }

  void getProductReviews() async {
    final _list = await api.getReviewsByProductId(model!.produtoId.toString());

    if (_list != null) {
      reviewsList.sink.add(_list);
    }
  }
}