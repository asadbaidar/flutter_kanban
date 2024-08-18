part of 'view.dart';

class AppCoreProviders extends StatelessWidget {
  const AppCoreProviders({
    super.key,
    this.deviceToken = '',
  });

  final String deviceToken;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HttpClient>(
          create: (context) => HttpClientImpl(
            environment: Environment.current,
          ),
        ),
        RepositoryProvider(
          create: (context) => AppRouter(),
        ),
      ],
      child: const AppFeatureProviders(),
    );
  }
}

class AppFeatureProviders extends StatelessWidget {
  const AppFeatureProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LocaleProvider(
      child: AppView(),
    );
  }
}
