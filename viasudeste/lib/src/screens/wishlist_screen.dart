import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/wishlist_bloc.dart';
import 'package:viasudeste/src/models/wishlist_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({ Key? key }) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  late WishlistBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = WishlistBloc();
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
          'Lista de Desejos',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<WishlistModel>?>(
        stream: _bloc.wishlistList.stream,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.hasData
              ? Text(
                  _bloc.wishlistList.value!.isNotEmpty
                  ? _bloc.wishlistList.value![0].produtoNome.toString()
                  : 'Você não possui itens na sua lista de desejos'
                )
              : CircularProgressIndicator(
                  color: Styles.mainPinkColor,
                ),
          );
        }
      ),
    );
  }
}