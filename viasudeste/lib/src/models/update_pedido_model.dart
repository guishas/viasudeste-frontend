class UpdatePedidoModel {
  String? pedidoId;
  String? produtoId;
  String? clienteId;
  String? vendedorId;
  int? pedidoQuantidadeProduto;
  String? pedidoStatus;
  String? pedidoDataCompra;
  String? pedidoDataPagamento;
  String? pedidoDataTransportadora;
  String? pedidoDataPrevista;
  String? pedidoDataEntregue;
  bool? pedidoAvaliado;

  UpdatePedidoModel(
      {this.pedidoId,
      this.produtoId,
      this.clienteId,
      this.vendedorId,
      this.pedidoQuantidadeProduto,
      this.pedidoStatus,
      this.pedidoDataCompra,
      this.pedidoDataPagamento,
      this.pedidoDataTransportadora,
      this.pedidoDataPrevista,
      this.pedidoDataEntregue,
      this.pedidoAvaliado});

  UpdatePedidoModel.fromJson(Map<String, dynamic> json) {
    pedidoId = json['pedidoId'];
    produtoId = json['produtoId'];
    clienteId = json['clienteId'];
    vendedorId = json['vendedorId'];
    pedidoQuantidadeProduto = json['pedidoQuantidadeProduto'];
    pedidoStatus = json['pedidoStatus'];
    pedidoDataCompra = json['pedidoDataCompra'];
    pedidoDataPagamento = json['pedidoDataPagamento'];
    pedidoDataTransportadora = json['pedidoDataTransportadora'];
    pedidoDataPrevista = json['pedidoDataPrevista'];
    pedidoDataEntregue = json['pedidoDataEntregue'];
    pedidoAvaliado = json['pedidoAvaliado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pedidoId'] = this.pedidoId;
    data['produtoId'] = this.produtoId;
    data['clienteId'] = this.clienteId;
    data['vendedorId'] = this.vendedorId;
    data['pedidoQuantidadeProduto'] = this.pedidoQuantidadeProduto;
    data['pedidoStatus'] = this.pedidoStatus;
    data['pedidoDataCompra'] = this.pedidoDataCompra;
    data['pedidoDataPagamento'] = this.pedidoDataPagamento;
    data['pedidoDataTransportadora'] = this.pedidoDataTransportadora;
    data['pedidoDataPrevista'] = this.pedidoDataPrevista;
    data['pedidoDataEntregue'] = this.pedidoDataEntregue;
    data['pedidoAvaliado'] = this.pedidoAvaliado;
    return data;
  }
}