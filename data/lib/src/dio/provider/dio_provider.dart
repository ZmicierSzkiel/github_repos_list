part of dio;

abstract interface class DioProvider {
  const DioProvider();

  void setupDio();

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}
