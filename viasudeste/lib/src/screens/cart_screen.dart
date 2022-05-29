import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/cart_bloc.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late CartBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = CartBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainLightGreyColor,
        title: Text(
          'Meu Carrinho',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<CartProdutoModel>?>(
        stream: _bloc.produtosList.stream,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.hasData
              ? Center(
                  child: _bloc.produtosList.value!.isNotEmpty
                    ? Text(_bloc.produtosList.value![0].produtoNome.toString())
                    : Text('Carrinho vazio'),
                )
              : CircularProgressIndicator(
                  color: Styles.mainPinkColor,
                )
          );
        }
      ),
    );
  }
}