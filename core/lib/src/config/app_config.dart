import 'flavors.dart';

class AppConfig {
  static const String _baseUrl = 'https://api.github.com';
  static const String _reposEndpoint = '/repositories';

  final String baseUrl;
  final String reposEndpoint;

  AppConfig._({
    required this.baseUrl,
    required this.reposEndpoint,
  });

  factory AppConfig.fromFlavor({
    required Flavor flavor,
  }) {
    final String baseUrl;
    final String reposEndpoint;

    switch (flavor) {
      case Flavor.dev:
        baseUrl = _baseUrl;
        reposEndpoint = _reposEndpoint;
        break;
      case Flavor.prod:
        baseUrl = _baseUrl;
        reposEndpoint = _reposEndpoint;
        break;
      case Flavor.release:
        baseUrl = _baseUrl;
        reposEndpoint = _reposEndpoint;
        break;
    }

    return AppConfig._(
      baseUrl: baseUrl,
      reposEndpoint: reposEndpoint,
    );
  }
}
