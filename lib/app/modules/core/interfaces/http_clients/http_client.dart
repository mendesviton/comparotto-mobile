import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpClientHNT<T> {
  Future<T> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<T> post(String url, {dynamic data, Map<String, String>? headers});

  Future<T> put(String url, {dynamic data, Map<String, String>? headers});

  Future<T> delete(String url, {dynamic data, Map<String, String>? headers});

  Map<String, String> authenticatedHeader(String token);
}

class HttpClient implements HttpClientHNT<http.Response> {
  @override
  Future<http.Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final Uri uri = Uri.parse(url);
      final response = await http.get(
        uri.replace(queryParameters: queryParameters),
        headers: headers,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> post(
    String url, {
    data,
    Map<String, String>? headers,
  }) async {
    try {
      final Uri uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: jsonEncode(data),
        headers: headers,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> put(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final Uri uri = Uri.parse(url);
      final response = await http.put(
        uri,
        body: jsonEncode(data),
        headers: headers,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> delete(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final Uri uri = Uri.parse(url);
      final response = await http.delete(
        uri,
        body: jsonEncode(data),
        headers: headers,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Map<String, String> authenticatedHeader(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  
}
