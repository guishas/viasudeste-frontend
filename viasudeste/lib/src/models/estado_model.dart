class EstadoModel {
  String? estadoId;
  String? nome;

  EstadoModel({this.estadoId, this.nome});

  EstadoModel.fromJson(Map<String, dynamic> json) {
    estadoId = json['estadoId'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estadoId'] = this.estadoId;
    data['nome'] = this.nome;
    return data;
  }
}
