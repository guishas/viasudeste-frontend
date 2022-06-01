import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/avaliar_bloc.dart';
import 'package:viasudeste/src/components/review_textfield.dart';

class AvaliarScreen extends StatefulWidget {
  const AvaliarScreen({ Key? key }) : super(key: key);

  @override
  State<AvaliarScreen> createState() => _AvaliarScreenState();
}

class _AvaliarScreenState extends State<AvaliarScreen> {

  late AvaliarBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _formState = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = AvaliarBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text("Avaliar"),
        centerTitle: true,
        backgroundColor: Styles.mainLightGreyColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Avaliar produto",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Comentário",
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Container(
                  child: Form(
                    key: _formState,
                    child: ReviewTextField(
                      maxLines: 8,
                      controller: _bloc.comentarioController,
                      labelText: '',
                      formatters: [],
                      validator: (String? value) {
                        if (value != null && value.length > 0) {
                          return null;
                        } else {
                          return 'Comentário inválido';
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nota",
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 35,
                      allowHalfRating: true,
                      itemBuilder: (context, _) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      }, 
                      onRatingUpdate: (double rating) {
                        _bloc.score.sink.add(rating);
                      }
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                child: StreamBuilder<bool?>(
                  stream: _bloc.isLoading.stream,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      onPressed: () async {
                        var ret = await _bloc.createReview(_formState, context);
                
                        if (ret) {
                          Navigator.pop(context, true);
                        }
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
                          'Avaliar',
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
            ],
          ),
        ),
      ),
    );
  }
}