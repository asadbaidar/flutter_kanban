part of 'router.dart';

class AppRoutes {
  AppRoutes._();

  static String get initial => TabPage.route();

  static List<GoRoute> list() => [
        GoRoute(
          path: TabPage.path(),
          builder: (_, state) => TabPage(
            key: state.pageKey,
            page: state.pathParameters['page']!,
          ),
          routes: [
            GoRoute(
              path: ProjectPage.subroute(),
              pageBuilder: (_, __) => const ProjectPage(),
            ),
          ],
        ),
      ];
}
