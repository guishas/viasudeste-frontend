class MediaModel {
  String? mediaId;
  String? produtoId;
  String? imagem;

  MediaModel({this.mediaId, this.produtoId, this.imagem});

  MediaModel.fromJson(Map<String, dynamic> json) {
    mediaId = json['mediaId'];
    produtoId = json['produtoId'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mediaId'] = this.mediaId;
    data['produtoId'] = this.produtoId;
    data['imagem'] = this.imagem;
    return data;
  }
}
