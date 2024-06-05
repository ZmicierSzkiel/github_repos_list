part of dio;

class DioProviderImpl implements DioProvider {
  final AppConfig _appConfig;
  final Dio _dio;

  const DioProviderImpl({
    required AppConfig appConfig,
    required Dio dio,
  })  : _appConfig = appConfig,
        _dio = dio;

  @override
  void setupDio() {
    final String? token = dotenv.env['TOKEN'];

    if (token != null) {
      _dio.options = BaseOptions(
        baseUrl: _appConfig.baseUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    }
  }

  @override
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process data');
    } catch (e) {
      throw e;
    }
  }
}
