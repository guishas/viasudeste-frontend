class MyReviewsModel {
  String? reviewId;
  ReviewCliente? reviewCliente;
  String? pedidoId;
  ReviewProduto? reviewProduto;
  String? reviewTitulo;
  String? reviewComentario;
  double? reviewScore;

  MyReviewsModel(
      {this.reviewId,
      this.reviewCliente,
      this.pedidoId,
      this.reviewProduto,
      this.reviewTitulo,
      this.reviewComentario,
      this.reviewScore});

  MyReviewsModel.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    reviewCliente = json['reviewCliente'] != null
        ? new ReviewCliente.fromJson(json['reviewCliente'])
        : null;
    pedidoId = json['pedidoId'];
    reviewProduto = json['reviewProduto'] != null
        ? new ReviewProduto.fromJson(json['reviewProduto'])
        : null;
    reviewTitulo = json['reviewTitulo'];
    reviewComentario = json['reviewComentario'];
    reviewScore = (json['reviewScore'] as int).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewId'] = this.reviewId;
    if (this.reviewCliente != null) {
      data['reviewCliente'] = this.reviewCliente!.toJson();
    }
    data['pedidoId'] = this.pedidoId;
    if (this.reviewProduto != null) {
      data['reviewProduto'] = this.reviewProduto!.toJson();
    }
    data['reviewTitulo'] = this.reviewTitulo;
    data['reviewComentario'] = this.reviewComentario;
    data['reviewScore'] = this.reviewScore;
    return data;
  }
}

class ReviewCliente {
  String? clienteId;
  String? clienteNome;
  String? clienteEmail;
  String? clienteSenha;
  String? clienteCelular;
  String? clienteCPF;
  String? clienteCEP;
  String? clienteEndereco;
  String? clienteCidadeId;
  String? clienteEstadoId;
  double? clienteLatitude;
  double? clienteLongitude;
  bool? clienteIsVendedor;

  ReviewCliente(
      {this.clienteId,
      this.clienteNome,
      this.clienteEmail,
      this.clienteSenha,
      this.clienteCelular,
      this.clienteCPF,
      this.clienteCEP,
      this.clienteEndereco,
      this.clienteCidadeId,
      this.clienteEstadoId,
      this.clienteLatitude,
      this.clienteLongitude,
      this.clienteIsVendedor});

  ReviewCliente.fromJson(Map<String, dynamic> json) {
    clienteId = json['clienteId'];
    clienteNome = json['clienteNome'];
    clienteEmail = json['clienteEmail'];
    clienteSenha = json['clienteSenha'];
    clienteCelular = json['clienteCelular'];
    clienteCPF = json['clienteCPF'];
    clienteCEP = json['clienteCEP'];
    clienteEndereco = json['clienteEndereco'];
    clienteCidadeId = json['clienteCidadeId'];
    clienteEstadoId = json['clienteEstadoId'];
    clienteLatitude = json['clienteLatitude'];
    clienteLongitude = json['clienteLongitude'];
    clienteIsVendedor = json['clienteIsVendedor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clienteId'] = this.clienteId;
    data['clienteNome'] = this.clienteNome;
    data['clienteEmail'] = this.clienteEmail;
    data['clienteSenha'] = this.clienteSenha;
    data['clienteCelular'] = this.clienteCelular;
    data['clienteCPF'] = this.clienteCPF;
    data['clienteCEP'] = this.clienteCEP;
    data['clienteEndereco'] = this.clienteEndereco;
    data['clienteCidadeId'] = this.clienteCidadeId;
    data['clienteEstadoId'] = this.clienteEstadoId;
    data['clienteLatitude'] = this.clienteLatitude;
    data['clienteLongitude'] = this.clienteLongitude;
    data['clienteIsVendedor'] = this.clienteIsVendedor;
    return data;
  }
}

class ReviewProduto {
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

  ReviewProduto(
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

  ReviewProduto.fromJson(Map<String, dynamic> json) {
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
