import 'package:core/feature/project/domain/domain.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
}
