import 'package:dio/dio.dart';
import 'package:viasudeste/library/utilities/config.dart';
import 'package:viasudeste/src/models/categoria_model.dart';
import 'package:viasudeste/src/models/cidade_model.dart';
import 'package:viasudeste/src/models/cliente_model.dart';
import 'package:viasudeste/src/models/create_pagamento_model.dart';
import 'package:viasudeste/src/models/create_pedido_model.dart';
import 'package:viasudeste/src/models/estado_model.dart';
import 'package:viasudeste/src/models/my_reviews_model.dart';
import 'package:viasudeste/src/models/pagamento_model.dart';
import 'package:viasudeste/src/models/pedido_model.dart';
import 'package:viasudeste/src/models/produto_model.dart';
import 'package:viasudeste/src/models/review_model.dart';
import 'package:viasudeste/src/models/update_cliente_model.dart';
import 'package:viasudeste/src/models/update_vendedor_model.dart';
import 'package:viasudeste/src/models/vendedor_model.dart';
import 'package:viasudeste/src/models/wishlist_model.dart';

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
    try {
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
    } catch (e) {
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

  Future<List<ProdutoModel>?> getProdutos() async {
    try {
      String _path = Config.apiEndpoint + 'produtos/';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<ProdutoModel> _list = (_response.data as List)
            .map((e) => new ProdutoModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ProdutoModel?> getProdutoById(String id) async {
    try {
      String _path = Config.apiEndpoint + 'produtos/$id';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        return ProdutoModel.fromJson(_response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<WishlistModel>?> getWishlistByUserId(String userId) async {
    try {
      String _path = Config.apiEndpoint + 'wishlist/$userId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<WishlistModel> _list = (_response.data as List)
            .map((e) => new WishlistModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteWishlistById(String wishlistId) async {
    try {
      String _path = Config.apiEndpoint + 'wishlist/deletar/$wishlistId';

      Response _response = await Dio().delete(_path);

      if (_response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addWishlist(String clienteId, String produtoId) async {
    try {
      String _path = Config.apiEndpoint + 'wishlist/adicionar/';

      Response _response = await Dio().post(
        _path,
        data: {
          "clienteId": clienteId,
          "produtoId": produtoId,
        }
      );

      if (_response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<ReviewModel>?> getReviewsByProductId(String produtoId) async {
    try {
      String _path = Config.apiEndpoint + 'reviews/$produtoId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<ReviewModel> _list = (_response.data as List)
            .map((e) => new ReviewModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<MyReviewsModel>?> getReviewsByClienteId(String clienteId) async {
    try {
      String _path = Config.apiEndpoint + 'reviews/clientes/$clienteId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<MyReviewsModel> _list = (_response.data as List)
            .map((e) => new MyReviewsModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> adicionarPedido(CreatePedidoModel pedidoModel) async {
    try {
      String _path = Config.apiEndpoint + 'pedidos/adicionar/';

      Response _response = await Dio().post(
        _path,
        data: pedidoModel
      );

      if (_response.statusCode == 200) {
        return _response.data["pedidoId"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> adicionarPagamento(CreatePagamentoModel createPagamentoModel) async {
    try {
      String _path = Config.apiEndpoint + 'pagamentos/adicionar/';

      Response _response = await Dio().post(
        _path,
        data: createPagamentoModel
      );

      if (_response.statusCode == 200) {
        return _response.data["pagamentoId"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getCidadeById(String? cidadeId) async {
    try {
      String _path = Config.apiEndpoint + 'cidades/$cidadeId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        return _response.data["nome"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getEstadoById(String? estadoId) async {
    try {
      String _path = Config.apiEndpoint + 'estados/$estadoId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        return _response.data["nome"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<PedidoModel>?> getPedidosByClienteId(String? clienteId) async {
    try {
      String _path = Config.apiEndpoint + 'pedidos/cliente/$clienteId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<PedidoModel> _list = (_response.data as List)
            .map((e) => new PedidoModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<ProdutoModel>?> getProdutosByVendedorId(String? vendedorId) async {
    try {
      String _path = Config.apiEndpoint + 'produtos/vendedor/$vendedorId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        List<ProdutoModel> _list = (_response.data as List)
            .map((e) => new ProdutoModel.fromJson(e))
            .toList();

        return _list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<PagamentoModel?> getPagamentoByPedidoId(String? pedidoId) async {
    try {
      String _path = Config.apiEndpoint + 'pagamentos/pedido/$pedidoId';

      Response _response = await Dio().get(_path);

      if (_response.statusCode == 200) {
        return PagamentoModel.fromJson(_response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}