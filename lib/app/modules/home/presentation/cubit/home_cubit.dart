import 'package:bloc/bloc.dart';
import 'package:comparotto/app/modules/home/data/model/auth_response.dart';
import 'package:comparotto/app/modules/home/domain/usecase/auth_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/model/get_all_employee_response.dart';
import '../../domain/usecase/get_all_employees_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllEmployeesUseCase getAllEmployeesUseCase;
  final AuthUseCase authUseCase;
  HomeCubit(this.getAllEmployeesUseCase, this.authUseCase)
      : super(HomeInitial(Employee(), const []));
  TextEditingController passwordEditingController = TextEditingController();
  Future<void> getEmployees() async {
    emit(const GetEmployeesLoading(null, []));

    final result = await getAllEmployeesUseCase();

    result.fold(
        (l) => {
              emit(GetEmployeesError(
                  state.currentEmployee, state.employeesList, l.errorMessage))
            }, (getAllEmployeeResponse) {
      emit(
        GetEmployeesSuccess(
            null,
            getAllEmployeeResponse.employee!
                .where((element) => element.active == true)
                .toList()),
      );
    });
  }

  setCurrentEmplooye(Employee employee) {
    emit(GetEmployeesSuccess(employee, state.employeesList));
  }

  fetch() {
    emit(Fetching(state.currentEmployee, state.employeesList));
    emit(Fetched(state.currentEmployee, state.employeesList));
  }

  clearFields() {
    passwordEditingController.clear();
  }

  bool getButtonStatus() {
    return passwordEditingController.text.length >= 3;
  }

  Future auth() async {
    emit(AuthLoading(state.currentEmployee, state.employeesList));

    final result = await authUseCase(AuthParams(
        name: state.currentEmployee!.name!,
        password: passwordEditingController.text.trim()));
    result.fold(
        (failure) => emit(AuthError(
            state.currentEmployee, state.employeesList, failure.errorMessage)),
        (authResponse) {
      emit(AuthSuccess(
          state.currentEmployee, state.employeesList, authResponse));
      passwordEditingController.clear();
    });
  }
}
