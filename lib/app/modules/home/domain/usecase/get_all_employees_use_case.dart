import 'package:comparotto/app/modules/core/interfaces/usecases/usecases.dart';
import 'package:comparotto/app/modules/core/types/type_defs.dart';
import 'package:comparotto/app/modules/home/data/model/get_all_employee_response.dart';
import 'package:comparotto/app/modules/home/domain/repos/employee_repo.dart';

class GetAllEmployeesUseCase extends UsecaseWithoutParams<void> {
  const GetAllEmployeesUseCase(this._repo);

  final EmployeeRepo _repo;

  @override
  ResultFuture<GetAllEmployeeResponse> call() async =>
      _repo.getAllEmployeesResponse();
}
