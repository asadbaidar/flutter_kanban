import 'package:core/core.dart';

class AppEnvironment {
  const AppEnvironment._(); // coverage:ignore-line

  /// The name of the customer
  static const name = 'kanban';

  /// The app url scheme
  static const scheme = 'com.asadbaidar.kanban';

  /// Todoist host
  static const host = 'https://api.todoist.com';

  /// Todoist api token
  static const apiToken = 'TODOIST_API_TOKEN';

  /// The production environment
  static const prod = Environment(
    name: name,
    scheme: scheme,
    flavor: Flavor.prod,
    host: host,
    apiToken: apiToken,
  );

  /// The staging environment
  static const stage = Environment(
    name: name,
    scheme: scheme,
    flavor: Flavor.stage,
    host: host,
    apiToken: apiToken,
  );

  /// The QA environment
  static const qa = Environment(
    name: name,
    scheme: scheme,
    flavor: Flavor.qa,
    host: host,
    apiToken: apiToken,
  );

  /// The development environment
  static const dev = Environment(
    name: name,
    scheme: scheme,
    flavor: Flavor.dev,
    host: host,
    apiToken: apiToken,
  );
}
