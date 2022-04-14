class CidadeModel {
  String? cidadeId;
  String? estadoId;
  String? nome;

  CidadeModel({this.cidadeId, this.estadoId, this.nome});

  CidadeModel.fromJson(Map<String, dynamic> json) {
    cidadeId = json['cidadeId'];
    estadoId = json['estadoId'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidadeId'] = this.cidadeId;
    data['estadoId'] = this.estadoId;
    data['nome'] = this.nome;
    return data;
  }
}
