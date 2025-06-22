import 'dart:io';

import 'package:dio/dio.dart';
import '../string/api_string.dart';
import 'interceptors.dart';

class DioClient {
  late final Dio _dio;
  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiUrl.baseUrl,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      )..interceptors.addAll([AuthorizationInterceptor(), LoggerInterceptor()]);

  // GET METHOD
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // POST METHOD
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // UPLOAD IMAGE
  Future<Response> uploadFormData({
    required String url,
    required Map<String, dynamic> formFields,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formDataMap = <String, dynamic>{};

      for (final entry in formFields.entries) {
        final key = entry.key;
        final value = entry.value;

        if (value is File) {
          final fileName = value.path.split('/').last;
          formDataMap[key] = await MultipartFile.fromFile(
            value.path,
            filename: fileName,
          );
        } else {
          formDataMap[key] = value;
        }
      }

      final formData = FormData.fromMap(formDataMap);

      return await _dio.post(
        url,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: onSendProgress,
      );
    } catch (e) {
      rethrow;
    }
  }

  // UPLOAD IMAGE (PUT METHOD)
  Future<Response> uploadFormDataPut({
    required String url,
    required Map<String, dynamic> formFields,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formDataMap = <String, dynamic>{};

      for (final entry in formFields.entries) {
        final key = entry.key;
        final value = entry.value;

        if (value is File) {
          final fileName = value.path.split('/').last;
          formDataMap[key] = await MultipartFile.fromFile(
            value.path,
            filename: fileName,
          );
        } else {
          formDataMap[key] = value;
        }
      }

      final formData = FormData.fromMap(formDataMap);

      return await _dio.put(
        url,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: onSendProgress,
      );
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
