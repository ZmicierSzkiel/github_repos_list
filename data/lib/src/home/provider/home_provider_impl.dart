part of home;

class HomeProviderImpl implements HomeProvider {
  final AppConfig _appConfig;
  final DioProvider _dioProvider;

  const HomeProviderImpl({
    required AppConfig appConfig,
    required DioProvider dioProvider,
  })  : _appConfig = appConfig,
        _dioProvider = dioProvider;

  @override
  Future<List<Repo>> getReposByQuery(String query) async {
    try {
      final dynamic response = await _dioProvider.get(
        _appConfig.reposEndpoint,
        queryParameters: <String, dynamic>{
          "per_page": 15,
          "q": query,
        },
      );

      final List<dynamic> items = response['items'];
      final List<Repo> repos = items.map((dynamic item) {
        return RepoMapper.fromJson(item as Map<String, dynamic>);
      }).toList();

      return repos;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } catch (e) {
      throw ("Unimplemented error occured");
    }
  }
}
