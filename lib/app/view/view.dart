import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

part 'app_providers.dart';
part 'app_view.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.deviceToken = '',
  });

  final String deviceToken;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: AppCoreProviders(deviceToken: deviceToken),
    );
  }
}
