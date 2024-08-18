part of 'view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = context.read<AppRouter>();
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: AppTheme.light().data(context),
      darkTheme: AppTheme.dark().data(context),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: context.mediaQuery.copyWith(
          textScaler: TextScaler.noScaling,
        ),
        child: child!,
      ),
    );
  }
}
