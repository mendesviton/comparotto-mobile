class ProductModel {
  String? idFuncionario;
  String? nome;
  bool? vendivel;
  int? precoCusto;
  String? urlImage;
  int? quantidadeEstoque;
  String? codigoBarras;
  String? undMedida;
  int? quantidade;
  String? dataEntrada;

  ProductModel(
      {this.idFuncionario,
      this.nome,
      this.precoCusto,
      this.urlImage,
      this.quantidadeEstoque,
      this.codigoBarras,
      this.undMedida,
      this.quantidade,
      this.dataEntrada});

  ProductModel.fromJson(Map<String, dynamic> json) {
    idFuncionario = json['id_funcionario'];
    nome = json['nome'];
    precoCusto = json['preco_custo'];
    urlImage = json['url_image'];
    quantidadeEstoque = json['quantidade_estoque'];
    codigoBarras = json['codigo_barras'];
    undMedida = json['und_medida'];
    quantidade = json['quantidade'];
    dataEntrada = json['data_entrada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_funcionario'] = idFuncionario;
    data['nome'] = nome;
    data['preco_custo'] = precoCusto;
    data['url_image'] = urlImage;
    data['quantidade_estoque'] = quantidadeEstoque;
    data['codigo_barras'] = codigoBarras;
    data['und_medida'] = undMedida;
    data['quantidade'] = quantidade;
    data['data_entrada'] = dataEntrada;
    return data;
  }
}
