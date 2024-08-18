import 'package:common/common.dart';
import 'package:core/feature/project/presentation/page/project_view.dart';
import 'package:flutter/material.dart';

class ProjectPage extends Page<void> {
  const ProjectPage({super.key});

  static String route() => RouteUri.tab(subroute());

  static String subroute() => 'projects';

  @override
  Route<void> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      isScrollControlled: true,
      builder: (context) => const ProjectView(),
    );
  }
}
