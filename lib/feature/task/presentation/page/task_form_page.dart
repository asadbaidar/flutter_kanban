import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskFormPage extends Page<void> {
  const TaskFormPage({
    super.key,
    this.id,
  });

  final String? id;

  static String route(String from, {String? id}) => RouteUri.path(
        from,
        routes: [subroute()],
        query: {'id': id},
      );

  static String subroute() => 'taskForm';

  @override
  Route<void> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      constraints: context.fullscreenNoStatusBar,
      isScrollControlled: true,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TaskFormBloc(
              taskRepository: injector(),
              task: context.read<TaskBloc>().state.sectionTasks.getById(id),
            ),
          ),
          if (id != null) CommentProvider(taskId: id),
        ],
        child: const TaskFormContent(),
      ),
    );
  }
}
