class CategoriaModel {
  String? categoriaId;
  String? categoriaNome;

  CategoriaModel({this.categoriaId, this.categoriaNome});

  CategoriaModel.fromJson(Map<String, dynamic> json) {
    categoriaId = json['categoriaId'];
    categoriaNome = json['categoriaNome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriaId'] = this.categoriaId;
    data['categoriaNome'] = this.categoriaNome;
    return data;
  }
}
