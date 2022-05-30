import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/shared_prefs_helper.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class FinalizarCompraBloc extends BaseBloc {

  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  final produtos = BehaviorSubject<List<CartProdutoModel>?>.seeded(null);

  void initStateScreen() {
    if (ObjMem.objetoHelp1 is List<CartProdutoModel>) {
      produtos.sink.add(ObjMem.objetoHelp1);
    }

  }

  void disposeScreen() {
    produtos.close();

    disposeBaseBloc();
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
              'Tem certeza que deseja remover esse produto do seu pedido?',
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