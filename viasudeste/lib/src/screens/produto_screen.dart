import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/produto_bloc.dart';
import 'package:viasudeste/src/models/review_model.dart';

class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({ Key? key }) : super(key: key);

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {

  late ProdutoBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = ProdutoBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainLightGreyColor,
        toolbarHeight: 50,
      ),
      body: StreamBuilder<List<ReviewModel>?>(
        stream: _bloc.reviewsList.stream,
        builder: (context, snapshot) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: snapshot.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                                    child: Text(
                                      _bloc.model!.produtoNome.toString(),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                      ),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width,
                                child: _bloc.model!.produtoImagem == null
                                  ? Image.asset(
                                    'assets/images/viasudeste-logo-preto.png',
                                    width: 90,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  )
                                  : Image.network(
                                    _bloc.model!.produtoImagem.toString(),
                                    width: 60,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Categoria',
                                        style: TextStyle(
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        _bloc.model!.produtoCategoria!.categoriaNome.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Preço',
                                        style: TextStyle(
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        _bloc.model!.produtoPreco.toString().split(".")[1].length == 1
                                        ? "R\$ " + _bloc.model!.produtoPreco.toString().replaceAll('.', ",") + "0"
                                        : "R\$ " + _bloc.model!.produtoPreco.toString().replaceAll('.', ","),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Descrição',
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _bloc.model!.produtoDescricao.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vendido por',
                                        style: TextStyle(
                                          fontFamily: 'Calibri',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        _bloc.model!.produtoVendedor!.vendedorNome.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Disponibilidade',
                                        style: TextStyle(
                                          fontFamily: 'Calibri',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        _bloc.model!.produtoQuantidade == 0
                                        ? 'Esgotado'
                                        : 'Em estoque',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold,
                                          color: _bloc.model!.produtoQuantidade == 0
                                            ? Colors.red
                                            : Colors.green
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Avaliações (' + _bloc.model!.produtoQuantidadeNotas.toString() + ')',
                                    style: TextStyle(
                                      fontFamily: 'Calibri',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                              child: _bloc.reviewsList.value!.length == 0
                                ? Text('Esse produto ainda não possui avaliações.')
                                : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _bloc.reviewsList.value!.length > 5 ? 5 : _bloc.reviewsList.value!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _bloc.reviewsList.value![index].reviewCliente!.clienteNome.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Calibri',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: _bloc.reviewsList.value![index].reviewScore!.toDouble(),
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  ignoreGestures: true,
                                                  itemSize: 15,
                                                  itemBuilder: (context, _) {
                                                    return Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    );
                                                  }, 
                                                  onRatingUpdate: (rating) {
                                                                                
                                                  }
                                                ),
                                                Text(
                                                  _bloc.reviewsList.value![index].reviewComentario.toString(),
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                            ),
                            Visibility(
                              visible: _bloc.reviewsList.value!.length > 5,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _bloc.addProductToCart(context);
                                  }, 
                                  child: _bloc.isLoadingCart.value
                                    ? SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Styles.mainWhiteColor,
                                      ),
                                    )
                                    : Text(
                                      'Ver todas as avaliações',
                                      style: TextStyle(
                                        fontFamily: 'Cutive Mono',
                                        fontWeight: FontWeight.bold,
                                        color: Styles.mainBlackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Styles.mainLightPinkColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 35)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Styles.mainLightGreyColor,
                          )
                        )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: StreamBuilder<bool>(
                              stream: _bloc.isLoadingCart.stream,
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                  onPressed: () {
                                    _bloc.addProductToCart(context);
                                  }, 
                                  child: _bloc.isLoadingCart.value
                                    ? SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Styles.mainWhiteColor,
                                      ),
                                    )
                                    : Text(
                                      'Adicionar ao carrinho',
                                      style: TextStyle(
                                        fontFamily: 'Cutive Mono',
                                        fontWeight: FontWeight.bold,
                                        color: Styles.mainBlackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Styles.mainLightPinkColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 45)
                                  ),
                                );
                              }
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: StreamBuilder<bool>(
                              stream: _bloc.isLoading.stream,
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                  onPressed: () {
                                    _bloc.addProductToWishlist(context);
                                  }, 
                                  child: _bloc.isLoading.value
                                    ? SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Styles.mainWhiteColor,
                                      ),
                                    )
                                    : Text(
                                      'Adicionar à lista de desejos',
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
                                    fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 45)
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Styles.mainPinkColor,
                  ),
                )
          );
        }
      ),
    );
  }
}