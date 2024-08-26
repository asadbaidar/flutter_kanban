import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';

class SectionBloc extends Cubit<SectionState> {
  SectionBloc({required this.sectionRepository}) : super(const SectionState());

  final SectionRepository sectionRepository;

  Future<void> getSections() => when(
        state.dataState,
        act: () => sectionRepository.getSections(state.projectId),
        emit: (value) => emit(state.copyWith(dataState: value)),
      );

  void projectChanged(Project? project) {
    if (project == null || state.project == project) return;

    emit(state.copyWith(project: project));
    getSections();
  }
}
