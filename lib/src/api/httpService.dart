import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:test_dio/src/api/apiExtension.dart';

class HttpService {
  Dio _dio;
  final baseUrl = 'https://dev.z1mobile.com/api/v2/';

  HttpService() {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }),
    );
    initializeInterceptors();
  }

  Future<Response> getRequest(
    String endPoint, {
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParameters,
  }) async {
    Response _response;

    try {
      _response = await _dio.get(endPoint,
          options: Options(headers: headers), queryParameters: queryParameters);

      if (_response.statusCode >= 500 && _response.statusCode <= 599) {
        throw ApiExtension().alertErrorFunc("Server", "Internal Server Error");
      }
    } on TimeoutException catch (e) {
      throw Exception("Error Catch TimeOutException:" + e.message);
    } on SocketException catch (e) {
      throw Exception("Error Catch SocketException:" + e.message);
    } on DioError catch (e) {
      throw Exception("Error Catch DioError:" + e.message);
    } finally {}
    return _response;
  }

  Future<Response> postRequest(String endPoint, Map<String, dynamic> data,
      {Map<String, dynamic> headers}) async {
    Response _response;
    try {
      _response = await _dio.post(endPoint,
          data: FormData.fromMap(data), options: Options(headers: headers));
      if (_response.statusCode >= 500 && _response.statusCode == 599) {
        throw ApiExtension().alertErrorFunc("Server", "Internal Server Error");
      }
    } on TimeoutException catch (e) {
      throw Exception("Error Catch TimeOutException:" + e.message);
    } on SocketException catch (e) {
      throw Exception("Error Catch SocketException:" + e.message);
    } on DioError catch (e) {
      throw Exception("Error Catch DioError:" + e.message);
    }

    return _response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error) async {
          print(error.message);
        },
        onRequest: (request) async {
          print("${request.method} | ${request.path}");
        },
        onResponse: (response) async {
          print('${response.statusCode} | ${response.data}');
        },
      ),
    );
  }
}
