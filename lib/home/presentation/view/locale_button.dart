import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class LocaleButton extends StatelessWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomActionButton(
      text: context.locale == LocaleConstants.esES ? 'English' : 'Español',
      onPressed: () {
        final upComingLocale = context.locale == LocaleConstants.esES
            ? LocaleConstants.enUS
            : LocaleConstants.esES;
        context.setLocale(upComingLocale);
      },
    );
  }
}
