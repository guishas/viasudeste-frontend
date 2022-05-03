class UserModel {
  String? userId;
  String? userNome;
  String? userEmail;
  String? userSenha;
  String? userCelular;
  String? userCPF;
  String? userCEP;
  String? userEndereco;
  String? userCidadeId;
  String? userEstadoId;
  double? userLatitude;
  double? userLongitude;
  bool? userIsVendedor;

  UserModel(
      {this.userId,
      this.userNome,
      this.userEmail,
      this.userSenha,
      this.userCelular,
      this.userCPF,
      this.userCEP,
      this.userEndereco,
      this.userCidadeId,
      this.userEstadoId,
      this.userLatitude,
      this.userLongitude,
      this.userIsVendedor});

  UserModel.fromJson(Map<String, dynamic> json, bool isVendedor) {
    if (isVendedor) {
      userId = json['vendedorId'];
      userNome = json['vendedorNome'];
      userEmail = json['vendedorEmail'];
      userSenha = json['vendedorSenha'];
      userCelular = json['vendedorCelular'];
      userCPF = json['vendedorCPF'];
      userCEP = json['vendedorCEP'];
      userEndereco = json['vendedorEndereco'];
      userCidadeId = json['vendedorCidadeId'];
      userEstadoId = json['vendedorEstadoId'];
      userLatitude = json['vendedorLatitude'];
      userLongitude = json['vendedorLongitude'];
      userIsVendedor = json['vendedorIsVendedor'];
    } else {
      userId = json['clienteId'];
      userNome = json['clienteNome'];
      userEmail = json['clienteEmail'];
      userSenha = json['clienteSenha'];
      userCelular = json['clienteCelular'];
      userCPF = json['clienteCPF'];
      userCEP = json['clienteCEP'];
      userEndereco = json['clienteEndereco'];
      userCidadeId = json['clienteCidadeId'];
      userEstadoId = json['clienteEstadoId'];
      userLatitude = json['clienteLatitude'];
      userLongitude = json['clienteLongitude'];
      userIsVendedor = json['clienteIsVendedor'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userNome'] = this.userNome;
    data['userEmail'] = this.userEmail;
    data['userSenha'] = this.userSenha;
    data['userCelular'] = this.userCelular;
    data['userCPF'] = this.userCPF;
    data['userCEP'] = this.userCEP;
    data['userEndereco'] = this.userEndereco;
    data['userCidadeId'] = this.userCidadeId;
    data['userEstadoId'] = this.userEstadoId;
    data['userLatitude'] = this.userLatitude;
    data['userLongitude'] = this.userLongitude;
    data['userIsVendedor'] = this.userIsVendedor;
    return data;
  }
}
