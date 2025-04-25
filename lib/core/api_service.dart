import 'dart:io';

import 'package:dio/dio.dart';

import 'errors/failure.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = 'http://mdev.yemensoft.net:8087/OnyxDeliveryService/';

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<List<dynamic>> get({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(headers: headers),
    );
    print(response.data);

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await _dio.post(
        '$baseUrl$endPoint',
        data: data,
        options: Options(validateStatus: (_) => true, headers: headers),
      );

      print(response.data);

      if (response.data is String) {
        if (response.data is String) {
          return {'message': data};
        }
        throw FormatException('Unexpected response: ${response.data}');
      }

      if (response.data is Map<String, dynamic>) {
        return response.data;
      }

      throw ServerFailure(
        'Unexpected response type: ${response.data.runtimeType}',
      );
    } catch (e, s) {
      print('from api Exception details:\n $e');
      print('from api Stack trace:\n $s');
      if (e is DioException &&
          (e.type == DioExceptionType.unknown ||
              e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.connectionError)) {
        throw ServerFailure('No Internet Connection');
      } else if (e is SocketException) {
        if (e.message.contains('Failed host lookup')) {
          throw ServerFailure('Failed to resolve hostname');
        } else {
          throw ServerFailure('No Internet Connection');
        }
      } else {
        throw ServerFailure(e.toString());
      }
    }
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await _dio.put(
        '$baseUrl$endPoint',
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make PUT request , Error: $error , Stacktrace: $stacktrace ',
      );
    }
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await _dio.patch(
        '$baseUrl$endPoint',
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make PATCH request , Error: $error , Stacktrace: $stacktrace ',
      );
    }
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await _dio.delete(
        '$baseUrl$endPoint',
        options: Options(headers: headers),
      );

      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make DELETE request , Error: $error , Stacktrace: $stacktrace ',
      );
    }
  }

  Future<Map<String, dynamic>> postRequestWithFiles({
    required String endPoint,
    required Map<String, dynamic> data,
    required List<File> imageFiles,
    Map<String, String>? headers,
    required File file,
  }) async {
    try {
      FormData formData = FormData.fromMap(data);

      if (imageFiles.isEmpty != true) {
        for (var file in imageFiles) {
          String fileName = file.path.split('/').last;
          formData.files.add(
            MapEntry(
              "Images",
              await MultipartFile.fromFile(file.path, filename: fileName),
            ),
          );
        }
      }

      var response = await _dio.post(
        '$baseUrl$endPoint',
        data: formData,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make POST request with files, Error: $error , Stacktrace: $stacktrace',
      );
    }
  }
}
