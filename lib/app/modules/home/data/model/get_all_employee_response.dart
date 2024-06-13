class GetAllEmployeeResponse {
  List<Employee>? employeeList;

  GetAllEmployeeResponse(this.employeeList);

  GetAllEmployeeResponse.fromJson(List<dynamic>? json) {
    employeeList = [];
    if (json != null) {
      for (var v in json) {
        employeeList!.add(Employee.fromJson(v));
      }
    }
  }
}

class Employee {
  String? id;
  String? criadoEm;
  String? nome;
  bool? ativo;
  List<LancamentoVendas>? lancamentoVendas;
  List<ProdutoMovimentacoes>? produtoMovimentacoes;

  Employee(
      {this.id,
      this.criadoEm,
      this.nome,
      this.ativo,
      this.lancamentoVendas,
      this.produtoMovimentacoes});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    criadoEm = json['criado_em'];
    nome = json['nome'];
    ativo = json['ativo'];
    if (json['lancamento_vendas'] != null) {
      lancamentoVendas = <LancamentoVendas>[];
      json['lancamento_vendas'].forEach((v) {
        lancamentoVendas!.add(LancamentoVendas.fromJson(v));
      });
    }
    if (json['produto_movimentacoes'] != null) {
      produtoMovimentacoes = <ProdutoMovimentacoes>[];
      json['produto_movimentacoes'].forEach((v) {
        produtoMovimentacoes!.add(ProdutoMovimentacoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['criado_em'] = criadoEm;
    data['nome'] = nome;
    data['ativo'] = ativo;
    if (lancamentoVendas != null) {
      data['lancamento_vendas'] =
          lancamentoVendas!.map((v) => v.toJson()).toList();
    }
    if (produtoMovimentacoes != null) {
      data['produto_movimentacoes'] =
          produtoMovimentacoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LancamentoVendas {
  String? id;
  String? criadoEm;
  String? precoCalculado;
  String? precoFinal;
  String? formaPagamento;

  LancamentoVendas(
      {this.id,
      this.criadoEm,
      this.precoCalculado,
      this.precoFinal,
      this.formaPagamento});

  LancamentoVendas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    criadoEm = json['criado_em'];
    precoCalculado = json['preco_calculado'];
    precoFinal = json['preco_final'];
    formaPagamento = json['forma_pagamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['criado_em'] = criadoEm;
    data['preco_calculado'] = precoCalculado;
    data['preco_final'] = precoFinal;
    data['forma_pagamento'] = formaPagamento;
    return data;
  }
}

class ProdutoMovimentacoes {
  String? id;
  String? criadoEm;
  String? type;
  String? quantidade;
  String? quantidadeRestante;

  ProdutoMovimentacoes(
      {this.id,
      this.criadoEm,
      this.type,
      this.quantidade,
      this.quantidadeRestante});

  ProdutoMovimentacoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    criadoEm = json['criado_em'];
    type = json['type'];
    quantidade = json['quantidade'];
    quantidadeRestante = json['quantidade_restante'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['criado_em'] = criadoEm;
    data['type'] = type;
    data['quantidade'] = quantidade;
    data['quantidade_restante'] = quantidadeRestante;
    return data;
  }
}
