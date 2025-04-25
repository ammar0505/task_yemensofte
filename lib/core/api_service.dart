import 'dart:io';
import 'package:dio/dio.dart';
import 'errors/failure.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "http://mdev.yemensoft.net:8087/";

  ApiService(this._dio);
  // {
  //   _dio.options.headers['Content-Type'] = 'application/json';
  // }
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
        // إذا كانت الاستجابة نصًا غير متوقع، رمي استثناء
        throw FormatException('Unexpected response: ${response.data}');
      }

      // إذا كانت الاستجابة بالفعل Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        return response.data;
      }

      // في حالة عدم توافق النوع، يمكن رمي خطأ مناسب
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

  // put method
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

  // patch method
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

  // delete method
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
    // required File pdfFile,
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

  Future<Map<String, dynamic>> postRequestWithFileAndImage({
    required String endPoint,
    required Map<String, dynamic> data,
    required File? file,
    Map<String, String>? headers,
  }) async {
    try {
      FormData formData = FormData();

      print('Data provided: $data');

      if (data.containsKey('OrderId')) {
        formData.fields.add(MapEntry('OrderId', data['OrderId'].toString()));
      } else {
        throw Exception('OrderId  is required');
      }
      if (data.containsKey('Amount')) {
        formData.fields.add(MapEntry('Amount', data['Amount'].toString()));
      } else {
        throw Exception('Amount  is required');
      }

      if (data.containsKey('Currency')) {
        formData.fields.add(MapEntry('Currency', data['Currency'].toString()));
      } else {
        throw Exception('Currency  is required');
      }
      if (data.containsKey('PaymentMethod')) {
        formData.fields.add(
          MapEntry('PaymentMethod', data['PaymentMethod'].toString()),
        );
      } else {
        throw Exception('PaymentMethod   is required');
      }

      if (file != null && file.existsSync()) {
        String fileName = file.path.split('/').last;
        formData.files.add(
          MapEntry(
            "Voucher",
            await MultipartFile.fromFile(file.path, filename: fileName),
          ),
        );
      } else {
        print('error ');
      }
      // Make the POST request
      var response = await _dio.post(
        '$baseUrl$endPoint',
        data: formData,
        options: Options(headers: headers),
      );
      print('Response: ${response.data}');
      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make POST request with files, Error: $error, Stacktrace: $stacktrace',
      );
    }
  }

  Future<Map<String, dynamic>> postRequestWithImageammar({
    required String endPoint,
    required Map<String, dynamic> data,
    required File file,
    Map<String, String>? headers,
  }) async {
    try {
      FormData formData = FormData();

      // Print the entire data map for debugging
      print('Data provided: $data');

      // Check if Date is present and valid

      if (data.containsKey('StoreMainCategoriesIds')) {
        formData.fields.add(
          MapEntry(
            'StoreMainCategoriesIds',
            data['StoreMainCategoriesIds'].toString(),
          ),
        );
      } else {
        throw Exception('StoreMainCategoriesIds is required');
      }
      if (data.containsKey('MainImage')) {
        formData.fields.add(
          MapEntry('MainImage', data['MainImage'].toString()),
        );
      } else {
        throw Exception('MainImage is required');
      }
      if (data.containsKey('StoreImages')) {
        formData.fields.add(
          MapEntry('StoreImages', data['StoreImages'].toString()),
        );
      } else {
        throw Exception('StoreImages is required');
      }
      // Add invoice Amount and amount
      if (data.containsKey('StoreSupervisorId')) {
        formData.fields.add(
          MapEntry('StoreSupervisorId', data['StoreSupervisorId'].toString()),
        );
      } else {
        throw Exception('StoreSupervisorId is required');
      }
      // Add invoice Type and amount
      if (data.containsKey('Name')) {
        formData.fields.add(MapEntry('Name', data['Name'].toString()));
      } else {
        throw Exception('Name is required');
      }
      if (data.containsKey('PhoneNumber')) {
        formData.fields.add(
          MapEntry('PhoneNumber', data['PhoneNumber'].toString()),
        );
      } else {
        throw Exception('PhoneNumber is required');
      }
      if (data.containsKey('Password')) {
        formData.fields.add(MapEntry('Password', data['Password'].toString()));
      } else {
        throw Exception('Password is required');
      }
      if (data.containsKey('ConfirmPassword')) {
        formData.fields.add(
          MapEntry('ConfirmPassword', data['ConfirmPassword'].toString()),
        );
      } else {
        return {};
      }
      // if (data.containsKey('ShopNumber')) {
      //   formData.fields
      //       .add(MapEntry('ShopNumber', data['ShopNumber'].toString()));
      // } else {
      //   return {};
      // }
      // if (data.containsKey('ShopLocation')) {
      //   formData.fields
      //       .add(MapEntry('ShopLocation', data['ShopLocation'].toString()));
      // } else {
      //   return {};
      // }

      // Check the file
      if (file.existsSync()) {
        String fileName = file.path.split('/').last;
        formData.files.add(
          MapEntry(
            "MainImage",
            await MultipartFile.fromFile(file.path, filename: fileName),
          ),
        );
      } else {
        throw Exception('File does not exist');
      }

      // Make the POST request
      var response = await _dio.post(
        '$baseUrl$endPoint',
        data: formData,
        options: Options(headers: headers),
      );
      print('Response: ${response.data}');
      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make POST request with files, Error: $error, Stacktrace: $stacktrace',
      );
    }
  }

  Future<Map<String, dynamic>> putRequestWithFiles({
    required String endPoint,
    required Map<String, dynamic> data,
    // required List<File> imageFiles,
    required File mainImage,
    Map<String, String>? headers,
  }) async {
    try {
      // إعداد بيانات النموذج
      FormData formData = FormData.fromMap(data);

      // إضافة الصورة الرئيسية
      String mainImageName = mainImage.path.split('/').last;
      formData.files.add(
        MapEntry(
          "MainImage",
          await MultipartFile.fromFile(mainImage.path, filename: mainImageName),
        ),
      );

      // إضافة الصور الإضافية (إذا توفرت)
      //   if (imageFiles.isNotEmpty) {
      //     for (var file in imageFiles) {
      //       String fileName = file.path.split('/').last;
      //       formData.files.add(MapEntry(
      //         "StoreImages",
      //         await MultipartFile.fromFile(file.path, filename: fileName),
      //       ));
      //   }
      // } else {
      //   // إذا لم تكن هناك صور إضافية
      //   formData.fields.add(const MapEntry("StoreImages", ""));
      // }

      // إرسال الطلب باستخدام PUT
      var response = await _dio.put(
        '$baseUrl$endPoint',
        data: formData,
        options: Options(headers: headers),
      );
      print('Response: ${response.data}');
      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
        'Failed to make POST request with files, Error: $error, Stacktrace: $stacktrace',
      );
    }
  }
}
