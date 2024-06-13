// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comparotto/app/modules/core/errors/exceptions.dart';
import 'package:comparotto/app/modules/core/types/type_defs.dart';
import 'package:comparotto/app/modules/home/data/datasources/employee_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../data/model/get_all_employee_response.dart';

abstract class EmployeeRepo {
  ResultFuture<GetAllEmployeeResponse> getAllEmployeesResponse();
}

class EmployeeRepoImpl implements EmployeeRepo {
  EmployeeDataSource employeeDataSource;
  EmployeeRepoImpl(
    this.employeeDataSource,
  );
  @override
  ResultFuture<GetAllEmployeeResponse> getAllEmployeesResponse() async {
    try {
      final result = await employeeDataSource.getAllEmployeesResponse();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
