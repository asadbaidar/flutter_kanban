import 'package:common/common.dart';
import 'package:core/feature/project/data/data.dart';

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  const ProjectRemoteDataSourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<List<ProjectEntity>> getProjects() {
    return httpClient
        .get<JsonArray>(path: ProjectEndpoints.projects)
        .then((json) => json.mapJsonArray(ProjectEntity.fromJson) ?? []);
  }
}
