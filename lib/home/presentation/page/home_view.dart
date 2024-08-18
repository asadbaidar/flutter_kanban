part of 'page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        customTitle: _TitleView(),
        actions: [LocaleButton()],
      ),
      body: _HomeListView(),
    );
  }
}

class _TitleView extends StatelessWidget {
  const _TitleView();

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: LocaleStrings.appName,
      titleStyle: context.logo,
      titleMaxLines: 1,
      customSubtitle: Text(LocaleStrings.selectProject),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
