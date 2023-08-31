enum FlavorType {
  development,
  staging,
  production,
}

class Flavors {
  static FlavorType? _flavorType;
  static FlavorType? get flavorType {
    return _flavorType;
  }

  static Future<String> setEnvironment(String packageId) async {
    if (packageId.contains('.dev')) {
      Flavors._flavorType = FlavorType.development;
      return 'dev';
    } else if (packageId.contains('.stg')) {
      Flavors._flavorType = FlavorType.staging;
      return 'stg';
    } else {
      Flavors._flavorType = FlavorType.production;
      return 'prod';
    }
  }
}
