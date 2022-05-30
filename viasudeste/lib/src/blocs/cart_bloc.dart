import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class CartBloc extends BaseBloc {

  final SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final produtosList = BehaviorSubject<List<CartProdutoModel>?>.seeded(null);

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

  void emptyCart() async {
    await sharedPreferencesHelper.emptyCart();
    produtosList.sink.add([]);
  }

  void removeItemFromCart(String produtoId, BuildContext context) async {
    final _list = await sharedPreferencesHelper.removeItemFromCart(produtoId);

    if (_list != null) {
      produtosList.sink.add(_list);
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
            Text(
              'Tem certeza que deseja remover esse produto do seu carrinho?',
              style: TextStyle(
                fontFamily: 'Cutive Mono',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              }, 
              child: Text(
                'Sim',
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
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              }, 
              child: Text(
                'Não',
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

  Dialog getComfirmEmptyCart(BuildContext scaffoldContext, BuildContext dialogContext) {
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
            Text(
              'Tem certeza que deseja esvaziar seu carrinho?',
              style: TextStyle(
                fontFamily: 'Cutive Mono',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              }, 
              child: Text(
                'Sim',
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
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              }, 
              child: Text(
                'Não',
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

