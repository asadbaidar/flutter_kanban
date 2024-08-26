import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';

class TaskFormBloc extends Cubit<TaskFormState> with SafeBloc {
  TaskFormBloc({
    required this.taskRepository,
    Task? task,
  }) : super(task?.toState() ?? const TaskFormState());

  final TaskRepository taskRepository;

  Future<void> save() async {
    if (!state.isValidated) return;

    return when(
      state.saveState,
      act: () => state.isEditing
          ? taskRepository.updateTask(state.id, state.toDto())
          : taskRepository.createTask(state.toDto()),
      emit: (value) => emit(state.copyWith(saveState: value)),
    );
  }
}

extension TaskFormInputBloc on TaskFormBloc {
  void contentChanged(String value) {
    final content = value.toTextInput();
    emit(
      state.copyWith(
        content: content,
        validity: state.validateWith(content: content),
      ),
    );
  }

  void descriptionChanged(String value) {
    final description = value.toTextInput();
    emit(
      state.copyWith(
        description: description,
        validity: state.validateWith(description: description),
      ),
    );
  }

  void durationChanged(String value) {
    final duration = value.toPositiveInt();
    emit(
      state.copyWith(
        duration: duration,
        validity: state.validateWith(duration: duration),
      ),
    );
  }

  void durationUnitChanged(String value) {
    final durationUnit = DurationUnit.fromName(value).toFormInput();
    emit(
      state.copyWith(
        durationUnit: durationUnit,
        validity: state.validateWith(durationUnit: durationUnit),
      ),
    );
  }

  void sectionIdChanged(String? value) {
    if (value == null || value == state.sectionId.value) return;
    final sectionId =
        state.isEditing ? value.toPureTextInput() : value.toTextInput();
    emit(
      state.copyWith(
        sectionId: sectionId,
        validity: state.validateWith(sectionId: sectionId),
      ),
    );
  }

  void initSectionId(String? value) {
    if (state.sectionId.isEmpty) {
      emit(state.copyWith(sectionId: value.toPureTextInput()));
    }
  }
}
