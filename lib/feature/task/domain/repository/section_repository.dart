import 'package:core/feature/task/domain/domain.dart';

abstract class SectionRepository {
  Future<List<Section>> getSections(String projectId);
}
