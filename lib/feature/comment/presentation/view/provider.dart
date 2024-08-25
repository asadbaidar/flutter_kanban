
import 'package:core/core.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class CommentProvider extends SingleChildStatelessWidget {
  const CommentProvider({
    super.key,
    super.child,
    this.taskId,
    this.projectId,
  });

  final String? taskId;
  final String? projectId;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (context) => CommentBloc(
        commentRepository: injector(),
        taskId: taskId,
        projectId: projectId,
      )..getComments(),
      child: child,
    );
  }
}
