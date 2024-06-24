import 'package:comparotto/app/modules/core/interfaces/usecases/usecases.dart';
import 'package:comparotto/app/modules/core/types/type_defs.dart';
import 'package:comparotto/app/modules/home/data/model/auth_response.dart';
import 'package:comparotto/app/modules/home/domain/repos/employee_repo.dart';
import 'package:comparotto/app/modules/product/data/model/product_model.dart';
import 'package:equatable/equatable.dart';

// class AuthUseCase extends UsecaseWithParams<AuthResponse, AuthParams> {
//   const AuthUseCase(this._repo);

//   // final EmployeeRepo _repo;

//   @override
//   ResultFuture<AuthResponse> call(AuthParams authParams) async =>
//       _repo.auth(authParams: authParams);
// }

class CreateProductParams extends Equatable {
  const CreateProductParams({
    required this.product,
  });

  const CreateProductParams.empty() : product = null;

  final ProductModel? product;

  @override
  List<Object?> get props => [product];
}
