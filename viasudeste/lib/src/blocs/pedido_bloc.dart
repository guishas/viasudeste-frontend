import 'package:rxdart/rxdart.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/pagamento_model.dart';
import 'package:viasudeste/src/models/pedido_model.dart';
import 'package:viasudeste/src/repositories/api.dart';

class PedidoBloc extends BaseBloc {

  PedidoModel? pedidoModel;

  final Api api = Api();

  final cidadeNome = BehaviorSubject<String?>.seeded(null);
  final estadoNome = BehaviorSubject<String?>.seeded(null);
  final pagamentoModel = BehaviorSubject<PagamentoModel?>.seeded(null);
  
  void initStateScreen() {
    if (ObjMem.objetoHelp1 is PedidoModel) {
      pedidoModel = ObjMem.objetoHelp1;
    }

    getEstadoNomeById();
  }

  void disposeScreen() {
    cidadeNome.close();
    estadoNome.close();
    pagamentoModel.close();

    disposeBaseBloc();
  }

  void getCidadeNomeById() async {
    final _name = await api.getCidadeById(ObjMem.currentUser!.userCidadeId.toString());

    if (_name != null) {
      cidadeNome.sink.add(_name);
    }

    getPagamento();
  }

  void getEstadoNomeById() async {
    final _name = await api.getEstadoById(ObjMem.currentUser!.userEstadoId.toString());

    if (_name != null) {
      estadoNome.sink.add(_name);
    }

    getCidadeNomeById();
  }

  void getPagamento() async {
    final model = await api.getPagamentoByPedidoId(pedidoModel!.pedidoId.toString());

    if (model != null) {
      pagamentoModel.sink.add(model);
    }
  }
}