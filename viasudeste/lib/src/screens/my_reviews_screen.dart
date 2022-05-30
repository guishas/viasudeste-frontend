import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/my_reviews_bloc.dart';
import 'package:viasudeste/src/models/my_reviews_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';

class MyReviewsScreen extends StatefulWidget {
  const MyReviewsScreen({ Key? key }) : super(key: key);

  @override
  State<MyReviewsScreen> createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends State<MyReviewsScreen> {

  late MyReviewsBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = MyReviewsBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Avaliações'),
        centerTitle: true,
        backgroundColor: Styles.mainLightGreyColor,
        toolbarHeight: 50,
      ),
      body: StreamBuilder<List<MyReviewsModel>?>(
        stream: _bloc.reviewsList.stream,
        builder: (context, snapshot) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: snapshot.hasData
              ? ListView.builder(
                itemCount: _bloc.reviewsList.value!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () async {
                        ObjMem.objetoHelp1 = ProdutoModel.fromJson(_bloc.reviewsList.value![index].reviewProduto!.toJson());

                        var ret = await Navigator.pushNamed(context, Flows.produto);

                        if (ret != null) {
                          ObjMem.objetoHelp1 = null;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: index == (_bloc.reviewsList.value!.length)
                              ? BorderSide(
                                color: Colors.white
                              )
                              : BorderSide(
                                color: Styles.mainBlackColor,
                              ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _bloc.reviewsList.value![index].reviewProduto!.produtoNome.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.bold
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              _bloc.reviewsList.value![index].reviewComentario.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
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
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
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