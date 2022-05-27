class PedidoModel {
  String? pedidoId;
  String? produtoId;
  String? clienteId;
  String? vendedorId;
  String? pagamentoId;
  int? pedidoQuantidadeProduto;
  String? pedidoStatus;
  String? pedidoDataCompra;
  String? pedidoDataPagamento;
  String? pedidoDataTransportadora;
  String? pedidoDataPrevista;
  String? pedidoDataEntregue;

  PedidoModel(
      {this.pedidoId,
      this.produtoId,
      this.clienteId,
      this.vendedorId,
      this.pagamentoId,
      this.pedidoQuantidadeProduto,
      this.pedidoStatus,
      this.pedidoDataCompra,
      this.pedidoDataPagamento,
      this.pedidoDataTransportadora,
      this.pedidoDataPrevista,
      this.pedidoDataEntregue});

  PedidoModel.fromJson(Map<String, dynamic> json) {
    pedidoId = json['pedidoId'];
    produtoId = json['produtoId'];
    clienteId = json['clienteId'];
    vendedorId = json['vendedorId'];
    pagamentoId = json['pagamentoId'];
    pedidoQuantidadeProduto = json['pedidoQuantidadeProduto'];
    pedidoStatus = json['pedidoStatus'];
    pedidoDataCompra = json['pedidoDataCompra'];
    pedidoDataPagamento = json['pedidoDataPagamento'];
    pedidoDataTransportadora = json['pedidoDataTransportadora'];
    pedidoDataPrevista = json['pedidoDataPrevista'];
    pedidoDataEntregue = json['pedidoDataEntregue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pedidoId'] = this.pedidoId;
    data['produtoId'] = this.produtoId;
    data['clienteId'] = this.clienteId;
    data['vendedorId'] = this.vendedorId;
    data['pagamentoId'] = this.pagamentoId;
    data['pedidoQuantidadeProduto'] = this.pedidoQuantidadeProduto;
    data['pedidoStatus'] = this.pedidoStatus;
    data['pedidoDataCompra'] = this.pedidoDataCompra;
    data['pedidoDataPagamento'] = this.pedidoDataPagamento;
    data['pedidoDataTransportadora'] = this.pedidoDataTransportadora;
    data['pedidoDataPrevista'] = this.pedidoDataPrevista;
    data['pedidoDataEntregue'] = this.pedidoDataEntregue;
    return data;
  }
}
