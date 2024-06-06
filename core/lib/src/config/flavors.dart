enum Flavor {
  dev,
  prod,
  release,
}

extension FlavorCheck on Flavor {
  bool get isDev => this == Flavor.dev;

  bool get isProd => this == Flavor.prod;

  bool get isRelease => this == Flavor.release;
}
