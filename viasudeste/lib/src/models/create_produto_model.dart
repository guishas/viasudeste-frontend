class CreateProdutoModel {
  String? produtoVendedorId;
  String? produtoCategoriaId;
  String? produtoNome;
  String? produtoDescricao;
  double? produtoPreco;
  int? produtoQuantidade;

  CreateProdutoModel(
      {this.produtoVendedorId,
      this.produtoCategoriaId,
      this.produtoNome,
      this.produtoDescricao,
      this.produtoPreco,
      this.produtoQuantidade});

  CreateProdutoModel.fromJson(Map<String, dynamic> json) {
    produtoVendedorId = json['produtoVendedorId'];
    produtoCategoriaId = json['produtoCategoriaId'];
    produtoNome = json['produtoNome'];
    produtoDescricao = json['produtoDescricao'];
    produtoPreco = json['produtoPreco'];
    produtoQuantidade = json['produtoQuantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produtoVendedorId'] = this.produtoVendedorId;
    data['produtoCategoriaId'] = this.produtoCategoriaId;
    data['produtoNome'] = this.produtoNome;
    data['produtoDescricao'] = this.produtoDescricao;
    data['produtoPreco'] = this.produtoPreco;
    data['produtoQuantidade'] = this.produtoQuantidade;
    return data;
  }
}
