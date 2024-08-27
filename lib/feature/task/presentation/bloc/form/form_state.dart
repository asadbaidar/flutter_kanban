import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_state.freezed.dart';

typedef TaskSaveState = Data<Task>;

@freezed
class TaskFormState with _$TaskFormState {
  const factory TaskFormState({
    @Default(TaskSaveState()) TaskSaveState saveState,
    @Default(TextInput.pure()) TextInput content,
    @Default(TextInput.pure()) TextInput description,
    @Default(PositiveInt.pure()) PositiveInt duration,
    @Default(FormInput<DurationUnit?>.pure())
    FormInput<DurationUnit?> durationUnit,
    @Default(TextInput.pure()) TextInput sectionId,
    @Default(FormzStatus.pure) FormzStatus validity,
    Task? task,
  }) = _TaskFormState;
}

extension TaskFormValues on TaskFormState {
  String get id => task?.id ?? '';
}

extension TaskFormValidation on TaskFormState {
  FormzStatus validateWith({
    TextInput? content,
    TextInput? description,
    PositiveInt? duration,
    FormInput<DurationUnit?>? durationUnit,
    TextInput? sectionId,
  }) =>
      Forms.validate(
        requiredPure: isEditing,
        required: [
          content ?? this.content,
          sectionId ?? this.sectionId,
        ],
        optional: [
          description ?? this.description,
          duration ?? this.duration,
          durationUnit ?? this.durationUnit,
        ],
      );

  bool get isEditing => task != null;

  bool get isValidated => validity.isValidated;

  bool get isEditingPure => validity.isPure && isEditing;
}

extension TaskStateToDto on TaskFormState {
  TaskDto toDto() => TaskDto(
        content: content.value,
        description: description.value,
        duration: duration.value,
        durationUnit: durationUnit.value,
        sectionId: sectionId.value,
        // below fields are not editable for now
        labels: task?.labels,
        priority: task?.priority,
        dueString: task?.due?.string,
        dueDate: task?.due?.date,
        dueDatetime: task?.due?.datetime,
        assigneeId: task?.assigneeId,
      );
}

extension TaskToState on Task {
  TaskFormState toState() => TaskFormState(
        content: content.toPureTextInput(),
        description: description.toPureTextInput(),
        duration: PositiveInt.pure(duration?.amount?.toString() ?? ''),
        durationUnit: FormInput.pure(duration?.unit),
        sectionId: sectionId.toPureTextInput(),
        task: this,
      );
}
