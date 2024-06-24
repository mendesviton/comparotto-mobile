// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comparotto/app/modules/core/errors/exceptions.dart';
import 'package:comparotto/app/modules/core/types/type_defs.dart';
import 'package:comparotto/app/modules/home/data/datasources/employee_data_source.dart';
import 'package:comparotto/app/modules/home/data/model/auth_response.dart';
import 'package:comparotto/app/modules/home/domain/usecase/auth_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../data/model/get_all_employee_response.dart';

abstract class EmployeeRepo {
  ResultFuture<GetAllEmployeeResponse> getAllEmployeesResponse();
  ResultFuture<AuthResponse> auth({required AuthParams authParams});
}

class EmployeeRepoImpl implements EmployeeRepo {
  EmployeeDataSource employeeDataSource;
  EmployeeRepoImpl(
    this.employeeDataSource,
  );
  @override
  ResultFuture<GetAllEmployeeResponse> getAllEmployeesResponse() async {
    try {
      final result = await employeeDataSource.getAllEmployees();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<AuthResponse> auth({required AuthParams authParams}) async {
    try {
      final result = await employeeDataSource.auth(authParams);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
