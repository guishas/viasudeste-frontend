import 'package:dio/dio.dart';
import 'package:viasudeste/library/utilities/config.dart';
import 'package:viasudeste/src/models/cliente_model.dart';

class Api {

  Future<ClienteModel?> loginWithEmailAndPassword(String email, String password) async {
    try {
      String _path = Config.apiEndpoint + 'clientes/login/$email/$password';

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

}