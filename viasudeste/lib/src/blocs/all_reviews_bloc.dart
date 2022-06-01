import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/review_model.dart';

class AllReviewsBloc extends BaseBloc {

  List<ReviewModel>? reviewsList;

  void initStateScreen() {
    if (ObjMem.objetoHelp2 is List<ReviewModel>) {
      reviewsList = ObjMem.objetoHelp2;
    }
  }

  void disposeScreen() {

    disposeBaseBloc();
  }
}