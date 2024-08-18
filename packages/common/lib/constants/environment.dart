import 'package:common/common.dart';

class Environment {
  const Environment({
    required this.name,
    required String scheme,
    required this.flavor,
    required this.host,
    required this.apiToken,
  }) : _scheme = scheme;

  final String name;
  final String _scheme;
  final Flavor flavor;
  final String host;
  final String apiToken;

  String get scheme => '$_scheme${isProd ? '' : '.$flavor'}';

  HttpClientConfig get config => HttpClientConfig(
        baseUrl: host.endsWith('/') ? host : '$host/',
        enableLogs: !flavor.isProd,
        connectTimeout: 20.seconds,
      );

  bool get isProd => flavor.isProd;
  bool get isStage => flavor.isStage;
  bool get isQa => flavor.isQa;
  bool get isDev => flavor.isDev;

  static Environment current = const Environment(
    name: '',
    scheme: '',
    host: '',
    flavor: Flavor.dev,
    apiToken: '',
  );
}

enum Flavor {
  prod,
  stage,
  qa,
  dev;

  bool get isProd => this == Flavor.prod;
  bool get isStage => this == Flavor.stage;
  bool get isQa => this == Flavor.qa;
  bool get isDev => this == Flavor.dev;

  @override
  String toString() => name;
}
