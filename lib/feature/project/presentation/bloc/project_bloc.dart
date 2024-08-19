import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/project/presentation/bloc/bloc.dart';

class ProjectBloc extends Cubit<ProjectState> {
  ProjectBloc({required this.projectRepository}) : super(const ProjectState());

  final ProjectRepository projectRepository;

  Future<void> getProjects() => when(
        state.projectDataState,
        act: projectRepository.getProjects,
        emit: (value) => emit(state.copyWith(projectDataState: value)),
      );

  void selectProject(Project? value) {
    if (value == null) return;
    
    emit(state.copyWith(selectedProject: value));
  }
}
