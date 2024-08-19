import 'package:common/common.dart';
import 'package:core/common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

final injector = GetIt.instance;

Future<void> initialzeDependencies() async {
  injector
    // Network
    ..registerLazySingleton<HttpClient>(
      () => HttpClientImpl(environment: Environment.current),
    )

    // Router
    ..registerLazySingleton<AppRouter>(AppRouter.new)

    // Project
    ..registerLazySingleton<ProjectRemoteDataSource>(
      () => ProjectRemoteDataSourceImpl(httpClient: injector()),
    )
    ..registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(dataSource: injector()),
    )
    ..registerFactory<ProjectBloc>(
      () => ProjectBloc(projectRepository: injector())..getProjects(),
    );

  // // Task
  // ..registerLazySingleton<TaskRemoteDataSource>(
  //   () => TaskRemoteDataSourceImpl(httpClient: injector()),
  // )
  // ..registerLazySingleton<TaskRepository>(
  //   () => TaskRepositoryImpl(dataSource: injector()),
  // )
  // ..registerFactory<TaskBloc>(
  //   () => TaskBloc(taskRepository: injector())..getTasks(),
  // )

  // // Comment
  // ..registerLazySingleton<CommentRemoteDataSource>(
  //   () => CommentRemoteDataSourceImpl(httpClient: injector()),
  // )
  // ..registerLazySingleton<CommentRepository>(
  //   () => CommentRepositoryImpl(dataSource: injector()),
  // )
  // ..registerFactory<CommentBloc>(
  //   () => CommentBloc(commentRepository: injector())..getComments(),
  // );
}

class BlocProviderGet<T extends StateStreamableSource<Object?>>
    extends SingleChildStatelessWidget {
  const BlocProviderGet({
    super.key,
    super.child,
  });

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider<T>(
      create: (context) => injector(),
      child: child,
    );
  }
}
