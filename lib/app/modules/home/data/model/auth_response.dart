class AuthResponse {
  String? accessToken;
  Funcionario? funcionario;

  AuthResponse({this.accessToken, this.funcionario});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    funcionario = json['funcionario'] != null
        ? Funcionario.fromJson(json['funcionario'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    if (funcionario != null) {
      data['funcionario'] = funcionario!.toJson();
    }
    return data;
  }
}

class Funcionario {
  String? id;
  String? nome;
  String? urlImage;

  Funcionario({this.id, this.nome, this.urlImage});

  Funcionario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    urlImage = json['url_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['url_image'] = urlImage;
    return data;
  }
}
