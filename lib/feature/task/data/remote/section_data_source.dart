import 'package:core/feature/task/data/data.dart';

abstract class SectionRemoteDataSource {
  Future<List<SectionEntity>> getSections(String projectId);
}
