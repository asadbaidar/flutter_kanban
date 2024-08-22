import 'package:common/common.dart';
import 'package:core/feature/task/data/data.dart';

class SectionRemoteDataSourceImpl implements SectionRemoteDataSource {
  SectionRemoteDataSourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<List<SectionEntity>> getSections(String projectId) {
    return httpClient.get<JsonArray>(
      path: TaskEndpoints.sections,
      query: {
        'project_id': projectId,
      },
    ).then((json) => json.mapJsonArray(SectionEntity.fromJson) ?? []);
  }
}
