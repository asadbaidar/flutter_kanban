import 'package:core/feature/project/data/data.dart';
import 'package:core/feature/project/domain/domain.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl({required this.dataSource});

  final ProjectRemoteDataSource dataSource;

  @override
  Future<List<Project>> getProjects() {
    return dataSource.getProjects().then(
          (value) => value
              .expand(
                (e) => e.isInboxProject == true ? <Project>[] : [e.toModel()],
              )
              .toList(),
        );
  }
}
