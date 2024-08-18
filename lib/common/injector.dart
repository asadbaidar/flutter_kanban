import 'package:common/common.dart';
import 'package:core/common/common.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initialzeDependencies() async {
  injector
        //* Network
        ..registerLazySingleton<HttpClient>(
          () => HttpClientImpl(environment: Environment.current),
        )

        //* Router
        ..registerLazySingleton<AppRouter>(AppRouter.new)

      //* Data Sources

      //* Repositories

      //* Blocs
      ;
}
