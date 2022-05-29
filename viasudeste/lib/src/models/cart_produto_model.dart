import 'dart:convert';

class CartProdutoModel {
  String? produtoId;
  ProdutoVendedor? produtoVendedor;
  ProdutoCategoria? produtoCategoria;
  String? produtoNome;
  String? produtoDescricao;
  double? produtoPreco;
  int? produtoQuantidade;
  double? produtoAvgScore;
  int? produtoQuantidadeNotas;
  String? produtoImagem;

  CartProdutoModel(
      {this.produtoId,
      this.produtoVendedor,
      this.produtoCategoria,
      this.produtoNome,
      this.produtoDescricao,
      this.produtoPreco,
      this.produtoQuantidade,
      this.produtoAvgScore,
      this.produtoQuantidadeNotas,
      this.produtoImagem});

  CartProdutoModel.fromJson(Map<String, dynamic> json) {
    produtoId = json['produtoId'];
    produtoVendedor = json['produtoVendedor'] != null
        ? new ProdutoVendedor.fromJson(json['produtoVendedor'])
        : null;
    produtoCategoria = json['produtoCategoria'] != null
        ? new ProdutoCategoria.fromJson(json['produtoCategoria'])
        : null;
    produtoNome = json['produtoNome'];
    produtoDescricao = json['produtoDescricao'];
    produtoPreco = json['produtoPreco'];
    produtoQuantidade = json['produtoQuantidade'];
    produtoAvgScore = json['produtoAvgScore'];
    produtoQuantidadeNotas = json['produtoQuantidadeNotas'];
    produtoImagem = json['produtoImagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produtoId'] = this.produtoId;
    if (this.produtoVendedor != null) {
      data['produtoVendedor'] = this.produtoVendedor!.toJson();
    }
    if (this.produtoCategoria != null) {
      data['produtoCategoria'] = this.produtoCategoria!.toJson();
    }
    data['produtoNome'] = this.produtoNome;
    data['produtoDescricao'] = this.produtoDescricao;
    data['produtoPreco'] = this.produtoPreco;
    data['produtoQuantidade'] = this.produtoQuantidade;
    data['produtoAvgScore'] = this.produtoAvgScore;
    data['produtoQuantidadeNotas'] = this.produtoQuantidadeNotas;
    data['produtoImagem'] = this.produtoImagem;
    return data;
  }

  static Map<String, dynamic> toJsonEncode(CartProdutoModel produtoModel) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produtoId'] = produtoModel.produtoId;
    if (produtoModel.produtoVendedor != null) {
      data['produtoVendedor'] = produtoModel.produtoVendedor!.toJson();
    }
    if (produtoModel.produtoCategoria != null) {
      data['produtoCategoria'] = produtoModel.produtoCategoria!.toJson();
    }
    data['produtoNome'] = produtoModel.produtoNome;
    data['produtoDescricao'] = produtoModel.produtoDescricao;
    data['produtoPreco'] = produtoModel.produtoPreco;
    data['produtoQuantidade'] = produtoModel.produtoQuantidade;
    data['produtoAvgScore'] = produtoModel.produtoAvgScore;
    data['produtoQuantidadeNotas'] = produtoModel.produtoQuantidadeNotas;
    data['produtoImagem'] = produtoModel.produtoImagem;
    return data;
  }

  static String encode(List<CartProdutoModel> produtos) => json.encode(
    produtos
      .map<Map<String, dynamic>>((produto) => CartProdutoModel.toJsonEncode(produto))
      .toList(),
  );

  static List<CartProdutoModel> decode(String produtos) =>
    (json.decode(produtos) as List<dynamic>)
        .map<CartProdutoModel>((item) => CartProdutoModel.fromJson(item))
        .toList();
}

class ProdutoVendedor {
  String? vendedorId;
  String? vendedorNome;
  String? vendedorEmail;
  String? vendedorSenha;
  String? vendedorCelular;
  String? vendedorCPF;
  String? vendedorCEP;
  String? vendedorEndereco;
  String? vendedorCidadeId;
  String? vendedorEstadoId;
  double? vendedorLatitude;
  double? vendedorLongitude;
  bool? vendedorIsVendedor;
  String? createdAt;

  ProdutoVendedor(
      {this.vendedorId,
      this.vendedorNome,
      this.vendedorEmail,
      this.vendedorSenha,
      this.vendedorCelular,
      this.vendedorCPF,
      this.vendedorCEP,
      this.vendedorEndereco,
      this.vendedorCidadeId,
      this.vendedorEstadoId,
      this.vendedorLatitude,
      this.vendedorLongitude,
      this.vendedorIsVendedor,
      this.createdAt});

  ProdutoVendedor.fromJson(Map<String, dynamic> json) {
    vendedorId = json['vendedorId'];
    vendedorNome = json['vendedorNome'];
    vendedorEmail = json['vendedorEmail'];
    vendedorSenha = json['vendedorSenha'];
    vendedorCelular = json['vendedorCelular'];
    vendedorCPF = json['vendedorCPF'];
    vendedorCEP = json['vendedorCEP'];
    vendedorEndereco = json['vendedorEndereco'];
    vendedorCidadeId = json['vendedorCidadeId'];
    vendedorEstadoId = json['vendedorEstadoId'];
    vendedorLatitude = json['vendedorLatitude'];
    vendedorLongitude = json['vendedorLongitude'];
    vendedorIsVendedor = json['vendedorIsVendedor'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendedorId'] = this.vendedorId;
    data['vendedorNome'] = this.vendedorNome;
    data['vendedorEmail'] = this.vendedorEmail;
    data['vendedorSenha'] = this.vendedorSenha;
    data['vendedorCelular'] = this.vendedorCelular;
    data['vendedorCPF'] = this.vendedorCPF;
    data['vendedorCEP'] = this.vendedorCEP;
    data['vendedorEndereco'] = this.vendedorEndereco;
    data['vendedorCidadeId'] = this.vendedorCidadeId;
    data['vendedorEstadoId'] = this.vendedorEstadoId;
    data['vendedorLatitude'] = this.vendedorLatitude;
    data['vendedorLongitude'] = this.vendedorLongitude;
    data['vendedorIsVendedor'] = this.vendedorIsVendedor;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class ProdutoCategoria {
  String? categoriaId;
  String? categoriaNome;

  ProdutoCategoria({this.categoriaId, this.categoriaNome});

  ProdutoCategoria.fromJson(Map<String, dynamic> json) {
    categoriaId = json['categoriaId'];
    categoriaNome = json['categoriaNome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriaId'] = this.categoriaId;
    data['categoriaNome'] = this.categoriaNome;
    return data;
  }
}