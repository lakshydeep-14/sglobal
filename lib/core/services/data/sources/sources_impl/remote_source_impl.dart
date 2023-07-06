import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../app_config.dart';
import '../../../exceptions/all_dio_exceptions.dart';
import '../remote_source.dart';

@LazySingleton(as: RemoteSource)
class RemoteSourceImpl implements RemoteSource {
  Dio dio;
  RemoteSourceImpl({
    required this.dio,
  }) {
    enable();
  }

  @override
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic> queryParam = const {},
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParam,
      );

      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
      return {'data': response.data};
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  void enable() {
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOption, handler) async {
          requestOption.baseUrl = AppConfig.baseUrl;
          return handler.next(requestOption);
        },
        onError: (error, handler) async {
          handler.next(error);
        },
      ),
    );
  }
}
