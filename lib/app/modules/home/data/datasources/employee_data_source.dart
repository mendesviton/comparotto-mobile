import 'dart:convert';
import 'dart:io';

import 'package:comparotto/app/modules/core/errors/exceptions.dart';
import 'package:comparotto/app/modules/core/utils/network_url.dart';
import 'package:comparotto/app/modules/home/data/model/get_all_employee_response.dart';
import 'package:http/http.dart' as http;
import '../../../core/interfaces/http_clients/http_client.dart';

abstract class EmployeeDataSource {
  Future<GetAllEmployeeResponse> getAllEmployeesResponse();
}

class EmployeeDataSourceImpl implements EmployeeDataSource {
  final HttpClientHNT<http.Response> _httpClient;

  EmployeeDataSourceImpl(this._httpClient);
  @override
  Future<GetAllEmployeeResponse> getAllEmployeesResponse() async {
    try {
      final response = await _httpClient.get(
        NetworkUrl.getAllFuncionariosEndpoint,
      );
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
}
