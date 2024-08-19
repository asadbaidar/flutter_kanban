import 'package:common/common.dart';
import 'package:core/feature/project/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';

class SelectProjectView extends StatelessWidget {
  const SelectProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return CustomInkWell(
          pressedOpacity: 0.4,
          enabled: state.projectDataState.isNotLoading,
          onTap: () => context.go(ProjectPage.route(context.currentRoute)),
          child: state.projectDataState.when(
            loading: (_) => const Padding(
              padding: EdgeInsets.only(top: 6),
              child: CustomProgress.small(centered: false),
            ),
            otherwise: (_) => Row(
              children: [
                Text(
                  state.selectedProjectOrFirst?.name ??
                      LocaleStrings.selectProject,
                  style: context.body1,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_drop_down,
                  color: context.onSurface,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
