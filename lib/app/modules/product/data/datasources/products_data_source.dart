import 'dart:io';

import 'package:comparotto/app/modules/core/errors/exceptions.dart';
import 'package:comparotto/app/modules/core/interfaces/http_clients/http_client.dart';
import 'package:comparotto/app/modules/core/utils/network_url.dart';
import 'package:comparotto/app/modules/product/domain/usecase/create_product_use_case.dart';
import 'package:http/http.dart' as http;

abstract class ProductsDataSource {
  Future<void> createProduct(CreateProductParams createProductParams);
}

class ProductsDataSourceImpl implements ProductsDataSource {
  final HttpClientHNT<http.Response> _httpClient;

  ProductsDataSourceImpl(this._httpClient);
  @override
  Future<void> createProduct(CreateProductParams createProductParams) async {
    try {
      final response = await _httpClient.get(
          '${NetworkUrl.createProductEndpoint}?criarProdutoVendivel=${createProductParams.product!.vendivel}',
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201 || response.statusCode == 200) {
        return;
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
