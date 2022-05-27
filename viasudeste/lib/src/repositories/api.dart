import 'package:dio/dio.dart';
import 'package:viasudeste/library/utilities/config.dart';
import 'package:viasudeste/src/models/categoria_model.dart';
import 'package:viasudeste/src/models/cidade_model.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/models/estado_model.dart';
import 'package:viasudeste/src/models/update_cliente_model.dart';
import 'package:viasudeste/src/models/update_vendedor_model.dart';
import 'package:viasudeste/src/models/vendedor_model.dart';

class Api {

  Future<dynamic> loginWithEmailAndPassword(String email, String password) async {
    try {
      String _path = Config.apiEndpoint + 'login/$email/$password';

      Response _response = await Dio().get(_path);

      if (_response.data["statusCode"] == "200") {
        if (_response.data["isVendedor"] == true) {
          return VendedorModel.fromJson(_response.data["data"]);
        } else {
          return ClienteModel.fromJson(_response.data["data"]);
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ClienteModel?> createClienteAccount(ClienteModel model) async {
    String _path = Config.apiEndpoint + 'clientes/adicionar/';

    Response _response = await Dio().post(
      _path,
      data: model,
    );

    if (_response.data["statusCode"] == '200') {
      return ClienteModel.fromJson(_response.data["data"]);
    } else {
      return null;
    }
  }

  Future<VendedorModel?> createVendedorAccount(VendedorModel model) async {
    String _path = Config.apiEndpoint + 'vendedores/adicionar/';

    Response _response = await Dio().post(
      _path,
      data: model,
    );

    if (_response.data["statusCode"] == '200') {
      return VendedorModel.fromJson(_response.data["data"]);
    } else {
      return null;
    }
  }

  Future<ClienteModel?> getCliente(String id) async {
    try {
      String _path = Config.apiEndpoint + 'clientes/$id';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        return ClienteModel.fromJson(_response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<VendedorModel?> getVendedor(String id) async {
    try {
      String _path = Config.apiEndpoint + 'vendedores/$id';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        return VendedorModel.fromJson(_response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<CategoriaModel>?> getCategorias() async {
    try {
      String _path = Config.apiEndpoint + 'categorias/';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<CategoriaModel> _list = (_response.data as List)
            .map((e) => new CategoriaModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<EstadoModel>?> getEstados() async {
    try {
      String _path = Config.apiEndpoint + 'estados/';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<EstadoModel> _list = (_response.data as List)
            .map((e) => new EstadoModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<CidadeModel>?> getCidadesByEstadoId(String id) async {
    try {
      String _path = Config.apiEndpoint + 'cidades/estado/$id';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<CidadeModel> _list = (_response.data as List)
            .map((e) => new CidadeModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ClienteModel?> updateCliente(UpdateClienteModel model) async {
    try {
      String _path = Config.apiEndpoint + 'clientes/atualizar/';

      Response _response = await Dio().put(
        _path,
        data: model,
      );

      if (_response.statusCode == 200) {
        return ClienteModel.fromJson(_response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<VendedorModel?> updateVendedor(UpdateVendedorModel model) async {
    try {
      String _path = Config.apiEndpoint + 'vendedores/atualizar/';

      Response _response = await Dio().put(
        _path,
        data: model,
      );

      if (_response.statusCode == 200) {
        return VendedorModel.fromJson(_response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  
}