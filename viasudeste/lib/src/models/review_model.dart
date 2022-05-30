class ReviewModel {
  String? reviewId;
  ReviewCliente? reviewCliente;
  String? pedidoId;
  String? produtoId;
  String? reviewTitulo;
  String? reviewComentario;
  double? reviewScore;

  ReviewModel(
      {this.reviewId,
      this.reviewCliente,
      this.pedidoId,
      this.produtoId,
      this.reviewTitulo,
      this.reviewComentario,
      this.reviewScore});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    reviewCliente = json['reviewCliente'] != null
      ? new ReviewCliente.fromJson(json['reviewCliente'])
      : null;
    pedidoId = json['pedidoId'];
    produtoId = json['produtoId'];
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
    data['produtoId'] = this.produtoId;
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
