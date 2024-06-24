class GetAllEmployeeResponse {
  List<Employee>? employee;

  GetAllEmployeeResponse({this.employee});

  GetAllEmployeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['funcionarios'] != null) {
      employee = <Employee>[];
      json['funcionarios'].forEach((v) {
        employee!.add(Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employee != null) {
      data['funcionarios'] = employee!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  String? id;
  String? createdAt;
  String? name;
  String? urlImage;
  bool? active;

  Employee({this.id, this.createdAt, this.name, this.urlImage, this.active});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['criado_em'];
    name = json['nome'];
    urlImage = json['url_image'];
    active = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['criado_em'] = createdAt;
    data['nome'] = name;
    data['url_image'] = urlImage;
    data['ativo'] = active;
    return data;
  }
}
