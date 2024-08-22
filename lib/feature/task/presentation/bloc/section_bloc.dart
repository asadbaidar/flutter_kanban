import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';

class SectionBloc extends Cubit<SectionState> {
  SectionBloc({required this.sectionRepository}) : super(const SectionState());

  final SectionRepository sectionRepository;

  Future<void> getSections() => when(
        state.sectionDataState,
        act: () => sectionRepository.getSections(state.projectId),
        emit: (value) => emit(state.copyWith(sectionDataState: value)),
      );

  void projectChanged(Project? project) {
    if (project == null) return;
    final previous = state.project;

    emit(state.copyWith(project: project));

    if (previous != project) getSections();
  }
}
