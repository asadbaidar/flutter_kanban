import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.freezed.dart';

typedef ProjectDataState = Data<List<Project>>;

@Freezed()
class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default(ProjectDataState()) ProjectDataState projectDataState,
    Project? selectedProject,
  }) = _ProjectState;
}

extension ProjectStateValue on ProjectState {
  List<Project> get projects => projectDataState.value ?? [];

  Project? get selectedProjectOrFirst =>
      selectedProject ?? projects.firstOrNull;
}
