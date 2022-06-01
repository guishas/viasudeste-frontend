import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/pedido_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class OrdersBloc extends BaseBloc {

  final Api api = Api();

  final pedidosList = BehaviorSubject<List<PedidoModel>?>.seeded(null);

  void initStateScreen() {
    
    getPedidos();
  }

  void disposeScreen() {
    pedidosList.close();

    disposeBaseBloc();
  }

  void getPedidos() async {
    final _list = await api.getPedidosByClienteId(ObjMem.currentUser!.userId.toString());

    if (_list != null) {
      pedidosList.sink.add(_list);
    }
  }

  String getDateByISOString(String isoString) {
    String ret = "";

    String day = isoString.substring(8, 10);
    String month = isoString.substring(5, 7);
    String year = isoString.substring(0, 4);

    ret = day + "/" + month + "/" + year;

    return ret;
  }
}