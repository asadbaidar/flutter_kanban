import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'locale_strings.dart';

part 'locale_consts.dart';

class LocaleProvider extends StatelessWidget {
  const LocaleProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocaleConstants.supported,
      path: LocaleConstants.kAssetPath,
      fallbackLocale: LocaleConstants.enUS,
      child: child,
    );
  }
}
