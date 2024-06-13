import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/get_all_employee_response.dart';
import '../../domain/usecase/get_all_employees_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllEmployeesUseCase getAllEmployeesUseCase;
  HomeCubit(this.getAllEmployeesUseCase)
      : super(HomeInitial(Employee(), const []));

  Future<void> getEmployees() async {
    emit(const GetEmployeesLoading(null, []));

    final result = await getAllEmployeesUseCase();
    result.fold(
        (l) => {
              emit(GetEmployeesError(
                  state.currentEmployee, state.employeesList, l.errorMessage))
            },
        (getAllEmployeeResponse) => {
              emit(
                GetEmployeesSuccess(null, getAllEmployeeResponse.employeeList),
              )
            });
  }

  setCurrentEmplooye(Employee employee) {
    emit(GetEmployeesSuccess(employee, state.employeesList));
  }
}
