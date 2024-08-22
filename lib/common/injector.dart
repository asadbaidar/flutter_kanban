import 'package:common/common.dart';
import 'package:core/common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

final injector = GetIt.instance;

Future<void> initialzeDependencies() async {
  injector
    // Network
    ..registerSingleton(Environment.current)
    ..registerLazySingleton<HttpClient>(
      () => HttpClientImpl(environment: injector()),
    )

    // Router
    ..registerLazySingleton(AppRouter.new)

    // Project
    ..registerLazySingleton<ProjectRemoteDataSource>(
      () => ProjectRemoteDataSourceImpl(httpClient: injector()),
    )
    ..registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(dataSource: injector()),
    )
    ..registerFactory<ProjectBloc>(
      () => ProjectBloc(projectRepository: injector())..getProjects(),
    )

    // // Section
    ..registerLazySingleton<SectionRemoteDataSource>(
      () => SectionRemoteDataSourceImpl(httpClient: injector()),
    )
    ..registerLazySingleton<SectionRepository>(
      () => SectionRepositoryImpl(dataSource: injector()),
    )
    ..registerFactory<SectionBloc>(
      () => SectionBloc(sectionRepository: injector()),
    )

    // // Task
    ..registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(
        httpClient: injector(),
        environment: injector(),
      ),
    )
    ..registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(dataSource: injector()),
    )
    ..registerFactory<TaskBloc>(
      () => TaskBloc(taskRepository: injector()),
    );

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
