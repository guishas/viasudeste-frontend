import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/my_reviews_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class MyReviewsBloc extends BaseBloc {

  final Api api = Api();

  final reviewsList = BehaviorSubject<List<MyReviewsModel>?>.seeded(null); 

  void initStateScreen() {
    
    getReviews();
  }

  void disposeScreen() {
    reviewsList.close();

    disposeBaseBloc();
  }

  void getReviews() async {
    final _list = await api.getReviewsByClienteId(ObjMem.currentUser!.userId.toString());

    if (_list != null) {
      reviewsList.sink.add(_list);
    }
  }
}