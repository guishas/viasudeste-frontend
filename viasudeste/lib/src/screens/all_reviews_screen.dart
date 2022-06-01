import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/all_reviews_bloc.dart';
import 'package:viasudeste/src/models/my_reviews_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';

class AllReviewsScreen extends StatefulWidget {
  const AllReviewsScreen({ Key? key }) : super(key: key);

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {

  late AllReviewsBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = AllReviewsBloc();
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: _bloc.reviewsList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: index == (_bloc.reviewsList!.length)
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
                      _bloc.reviewsList![index].reviewComentario.toString(),
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
                            initialRating: _bloc.reviewsList![index].reviewScore!.toDouble(),
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
            );
          },
        )
      )
    );
  }
}