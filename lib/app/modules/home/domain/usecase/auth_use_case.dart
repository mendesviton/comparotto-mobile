import 'package:comparotto/app/modules/core/interfaces/usecases/usecases.dart';
import 'package:comparotto/app/modules/core/types/type_defs.dart';
import 'package:comparotto/app/modules/home/data/model/auth_response.dart';
import 'package:comparotto/app/modules/home/domain/repos/employee_repo.dart';
import 'package:equatable/equatable.dart';

class AuthUseCase extends UsecaseWithParams<AuthResponse, AuthParams> {
  const AuthUseCase(this._repo);

  final EmployeeRepo _repo;

  @override
  ResultFuture<AuthResponse> call(AuthParams authParams) async =>
      _repo.auth(authParams: authParams);
}

class AuthParams extends Equatable {
  const AuthParams({
    required this.name,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = name;
    data['senha'] = password;

    return data;
  }

  const AuthParams.empty()
      : name = '',
        password = '';

  final String name;
  final String password;

  @override
  List<String> get props => [name, password];
}
