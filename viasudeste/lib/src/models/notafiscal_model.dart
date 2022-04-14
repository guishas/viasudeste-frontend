class NotaFiscalModel {
  String? nfeId;
  String? pedidoId;
  String? produtoId;
  String? vendedorId;
  int? nfeQuantidade;
  double? nfePreco;
  double? nfeFrete;

  NotaFiscalModel({
    this.nfeId,
    this.pedidoId,
    this.produtoId,
    this.vendedorId,
    this.nfeQuantidade,
    this.nfePreco,
    this.nfeFrete
  });

  NotaFiscalModel.fromJson(Map<String, dynamic> json) {
    nfeId = json['nfeId'];
    pedidoId = json['pedidoId'];
    produtoId = json['produtoId'];
    vendedorId = json['vendedorId'];
    nfeQuantidade = json['nfeQuantidade'];
    nfePreco = json['nfePreco'];
    nfeFrete = json['nfeFrete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nfeId'] = this.nfeId;
    data['pedidoId'] = this.pedidoId;
    data['produtoId'] = this.produtoId;
    data['vendedorId'] = this.vendedorId;
    data['nfeQuantidade'] = this.nfeQuantidade;
    data['nfePreco'] = this.nfePreco;
    data['nfeFrete'] = this.nfeFrete;
    return data;
  }
}
