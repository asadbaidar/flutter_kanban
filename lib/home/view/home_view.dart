part of 'view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        customTitle: _TitleView(),
        actions: [_HomeOptionMenu()],
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

class _HomeOptionMenu extends StatelessWidget {
  const _HomeOptionMenu();

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      tooltip: LocaleStrings.menu,
      icon: const Icon(Icons.more_vert),
      onPressed: () => _showMenu(context),
    );
  }

  void _showMenu(BuildContext context) => showModalBottomSheet<void>(
        context: context,
        scrollControlDisabledMaxHeightRatio: 0.3,
        builder: (context) {
          return CustomBottomSheet(
            stretch: false,
            content: CustomListView.fixed(
              physics: const NeverScrollableScrollPhysics(),
              divider: const Divider(indent: 16, endIndent: 16),
              children: [
                _OptionItemView(
                  title: context.locale == LocaleConstants.esES
                      ? 'English'
                      : 'Español',
                  icon: const Icon(Icons.language),
                  onTap: () {
                    final upComingLocale =
                        context.locale == LocaleConstants.esES
                            ? LocaleConstants.enUS
                            : LocaleConstants.esES;
                    context.setLocale(
                      upComingLocale,
                    );
                  },
                ),
                _OptionItemView(
                  title: LocaleStrings.logOut,
                  icon: const AssetIcon(AssetIcons.exit),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      );
}

class _OptionItemView extends StatelessWidget {
  const _OptionItemView({
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomListTile(
          leading: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: IconTheme(
              data: context.localIconTheme.copyWith(color: context.primary),
              child: icon,
            ),
          ),
          title: title,
          titleStyle: context.body1,
        ),
      ),
    );
  }
}
