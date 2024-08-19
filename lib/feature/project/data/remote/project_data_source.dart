import 'package:core/feature/project/data/data.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectEntity>> getProjects();
}
