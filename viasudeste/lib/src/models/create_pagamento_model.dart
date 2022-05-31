class CreatePagamentoModel {
  String? clienteId;
  String? pedidoId;
  String? pagamentoMetodo;
  int? pagamentoParcelas;
  double? pagamentoValorTotal;
  int? pagamentoFinalCartao;

  CreatePagamentoModel({
    this.clienteId,
    this.pedidoId,
    this.pagamentoMetodo,
    this.pagamentoParcelas,
    this.pagamentoValorTotal,
    this.pagamentoFinalCartao
  });

  CreatePagamentoModel.fromJson(Map<String, dynamic> json) {
    clienteId = json['clienteId'];
    pedidoId = json['pedidoId'];
    pagamentoMetodo = json['pagamentoMetodo'];
    pagamentoParcelas = json['pagamentoParcelas'];
    pagamentoValorTotal = json['pagamentoValorTotal'];
    pagamentoFinalCartao = json['pagamentoFinalCartao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clienteId'] = this.clienteId;
    data['pedidoId'] = this.pedidoId;
    data['pagamentoMetodo'] = this.pagamentoMetodo;
    data['pagamentoParcelas'] = this.pagamentoParcelas;
    data['pagamentoValorTotal'] = this.pagamentoValorTotal;
    data['pagamentoFinalCartao'] = this.pagamentoFinalCartao;
    return data;
  }
}
