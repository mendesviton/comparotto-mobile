import 'dart:convert';
import 'dart:io';

import 'package:comparotto/app/modules/core/errors/exceptions.dart';
import 'package:comparotto/app/modules/core/utils/network_url.dart';
import 'package:comparotto/app/modules/home/data/model/auth_response.dart';
import 'package:comparotto/app/modules/home/data/model/get_all_employee_response.dart';
import 'package:comparotto/app/modules/home/domain/usecase/auth_use_case.dart';
import 'package:http/http.dart' as http;
import '../../../core/interfaces/http_clients/http_client.dart';

abstract class EmployeeDataSource {
  Future<GetAllEmployeeResponse> getAllEmployees();
  Future<AuthResponse> auth(AuthParams authParams);
}

class EmployeeDataSourceImpl implements EmployeeDataSource {
  final HttpClientHNT<http.Response> _httpClient;

  EmployeeDataSourceImpl(this._httpClient);
  @override
  Future<GetAllEmployeeResponse> getAllEmployees() async {
    try {
      final response = await _httpClient.get(NetworkUrl.getAllEmployeesEndpoint,
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201 || response.statusCode == 200) {
        return GetAllEmployeeResponse.fromJson(json.decode(response.body));
      }
      throw ServerException(
        message: response.body,
        statusCode: response.statusCode.toString(),
      );
    } on HttpException catch (e) {
      throw ServerException(
        message: e.message,
        statusCode: '500',
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<AuthResponse> auth(AuthParams authParams) async {
    try {
      var data = {'nome': authParams.name, 'senha': authParams.password};
      final response = await _httpClient.post(NetworkUrl.authEndpoint,
          data: data, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201 || response.statusCode == 200) {
        return AuthResponse.fromJson(json.decode(response.body));
      }
      throw ServerException(
        message: response.body,
        statusCode: response.statusCode.toString(),
      );
    } on HttpException catch (e) {
      throw ServerException(
        message: e.message,
        statusCode: '500',
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
