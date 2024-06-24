part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  final Employee? currentEmployee;
  final List<Employee>? employeesList;

  const HomeState(this.currentEmployee, this.employeesList);
}

final class HomeInitial extends HomeState {
  const HomeInitial(super.currentEmployee, super.employeesList);
}

final class GetEmployeesLoading extends HomeState {
  const GetEmployeesLoading(super.currentEmployee, super.employeesList);
}

final class GetEmployeesSuccess extends HomeState {
  const GetEmployeesSuccess(super.currentEmployee, super.employeesList);
}

final class GetEmployeesError extends HomeState {
  final String message;
  const GetEmployeesError(
    super.currentEmployee,
    super.employeesList,
    this.message,
  );
}

final class AuthLoading extends HomeState {
  const AuthLoading(super.currentEmployee, super.employeesList);
}

final class Fetching extends HomeState {
  const Fetching(super.currentEmployee, super.employeesList);
}

final class Fetched extends HomeState {
  const Fetched(super.currentEmployee, super.employeesList);
}

final class AuthSuccess extends HomeState {
  final AuthResponse authResponse;
  const AuthSuccess(
      super.currentEmployee, super.employeesList, this.authResponse);
}

final class AuthError extends HomeState {
  final String message;
  const AuthError(
    super.currentEmployee,
    super.employeesList,
    this.message,
  );
}
