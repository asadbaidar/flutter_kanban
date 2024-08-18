part of 'view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String route() => RouteUri.tab(subroute());

  static String subroute() => TabItem.home.name;

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
