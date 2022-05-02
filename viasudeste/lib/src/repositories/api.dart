import 'package:dio/dio.dart';
import 'package:viasudeste/library/utilities/config.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/models/vendedor_model.dart';

class Api {

  Future<ClienteModel?> loginWithEmailAndPassword(String email, String password) async {
    try {
      String _path = Config.apiEndpoint + 'login/$email/$password';

      Response _response = await Dio().get(_path);

      if (_response.data["statusCode"] == "200") {
        return ClienteModel.fromJson(_response.data["data"]);
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
}