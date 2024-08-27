import 'package:common/common.dart';
import 'package:core/feature/task/data/data.dart';
import 'package:core/feature/task/domain/domain.dart';

class SectionRepositoryImpl implements SectionRepository {
  const SectionRepositoryImpl({required this.dataSource});

  final SectionRemoteDataSource dataSource;

  @override
  Future<List<Section>> getSections(String projectId) {
    return dataSource.getSections(projectId).then($mapToModels);
  }
}
