import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/wishlist_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class WishlistBloc extends BaseBloc {

  final Api api = Api();

  final wishlistList = BehaviorSubject<List<WishlistModel>?>.seeded(null);

  void initStateScreen() {

    getWishlist();
  }

  void disposeScreen() {
    wishlistList.close();

    disposeBaseBloc();
  }

  void getWishlist() async {
    final _list = await api.getWishlistByUserId(ObjMem.currentUser!.userId!);

    if (_list != null) {
      wishlistList.sink.add(_list);
    }
  }
}