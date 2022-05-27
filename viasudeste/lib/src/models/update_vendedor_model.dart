class UpdateVendedorModel {
  String? vendedorId;
  String? vendedorNome;
  String? vendedorEmail;
  String? vendedorCelular;
  String? vendedorCPF;
  String? vendedorCEP;
  String? vendedorEndereco;
  String? vendedorCidadeId;
  String? vendedorEstadoId;
  int? vendedorLatitude;
  int? vendedorLongitude;

  UpdateVendedorModel(
      {this.vendedorId,
      this.vendedorNome,
      this.vendedorEmail,
      this.vendedorCelular,
      this.vendedorCPF,
      this.vendedorCEP,
      this.vendedorEndereco,
      this.vendedorCidadeId,
      this.vendedorEstadoId,
      this.vendedorLatitude,
      this.vendedorLongitude});

  UpdateVendedorModel.fromJson(Map<String, dynamic> json) {
    vendedorId = json['vendedorId'];
    vendedorNome = json['vendedorNome'];
    vendedorEmail = json['vendedorEmail'];
    vendedorCelular = json['vendedorCelular'];
    vendedorCPF = json['vendedorCPF'];
    vendedorCEP = json['vendedorCEP'];
    vendedorEndereco = json['vendedorEndereco'];
    vendedorCidadeId = json['vendedorCidadeId'];
    vendedorEstadoId = json['vendedorEstadoId'];
    vendedorLatitude = json['vendedorLatitude'];
    vendedorLongitude = json['vendedorLongitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendedorId'] = this.vendedorId;
    data['vendedorNome'] = this.vendedorNome;
    data['vendedorEmail'] = this.vendedorEmail;
    data['vendedorCelular'] = this.vendedorCelular;
    data['vendedorCPF'] = this.vendedorCPF;
    data['vendedorCEP'] = this.vendedorCEP;
    data['vendedorEndereco'] = this.vendedorEndereco;
    data['vendedorCidadeId'] = this.vendedorCidadeId;
    data['vendedorEstadoId'] = this.vendedorEstadoId;
    data['vendedorLatitude'] = this.vendedorLatitude;
    data['vendedorLongitude'] = this.vendedorLongitude;
    return data;
  }
}
