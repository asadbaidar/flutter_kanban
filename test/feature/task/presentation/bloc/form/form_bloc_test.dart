import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockTaskRepository extends Mock implements TaskRepository {}

class FakeTask extends Fake implements Task {}

class FakeTaskDto extends Fake implements TaskDto {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late TaskFormBloc taskFormBloc;

  setUpAll(() {
    registerFallbackValue(FakeTask());
    registerFallbackValue(FakeTaskDto());
  });

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    taskFormBloc = TaskFormBloc(taskRepository: mockTaskRepository);
  });

  group('TaskFormBloc', () {
    test('initial state is correct', () {
      expect(taskFormBloc.state, equals(const TaskFormState()));
    });

    group('submit', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'does nothing when state is not validated',
        build: () => taskFormBloc,
        act: (bloc) async => await bloc.save(),
        expect: () => <TaskFormState>[],
        verify: (_) {
          verifyNever(() => mockTaskRepository.updateTask(any(), any()));
          verifyNever(() => mockTaskRepository.createTask(any()));
        },
      );

      //   blocTest<TaskFormBloc, TaskFormState>(
      //     'calls updateTask when editing and state is validated',
      //     build: () {
      //       taskFormBloc = TaskFormBloc(
      //         taskRepository: mockTaskRepository,
      //         task: Task(id: '1'), // Assuming Task has an id field
      //       );
      //       return taskFormBloc;
      //     },
      //     seed: () => TaskFormState(
      //       id: '1',
      //       content: 'Content'.toTextInput(),
      //       validity: Formsz.valid(), // Assuming Formsz.valid() means valid state
      //       isEditing: true,
      //     ),
      //     act: (bloc) async => await bloc.submit(),
      //     expect: () => [
      //       TaskFormState(
      //         id: '1',
      //         content: 'Content'.toTextInput(),
      //         validity: Formsz.valid(),
      //         saveState: SubmitState
      //             .loading(), // Assuming SubmitState has a loading state
      //         isEditing: true,
      //       ),
      //       TaskFormState(
      //         id: '1',
      //         content: 'Content'.toTextInput(),
      //         validity: Formsz.valid(),
      //         saveState: SubmitState
      //             .success(), // Assuming SubmitState has a success state
      //         isEditing: true,
      //       ),
      //     ],
      //     verify: (_) {
      //       verify(() => mockTaskRepository.updateTask('1', any())).called(1);
      //     },
      //   );
      //
      //   blocTest<TaskFormBloc, TaskFormState>(
      //     'calls createTask when not editing and state is validated',
      //     build: () {
      //       return TaskFormBloc(
      //         taskRepository: mockTaskRepository,
      //         task: Task(id: '1'),
      //       );
      //     },
      //     seed: () => TaskFormState(
      //       content: 'Content'.toTextInput(),
      //       validity: Formsz.valid(),
      //       isEditing: false,
      //     ),
      //     act: (bloc) async => await bloc.submit(),
      //     expect: () => [
      //       TaskFormState(
      //         content: 'Content'.toTextInput(),
      //         validity: Formsz.valid(),
      //         saveState: SubmitState.loading(),
      //         isEditing: false,
      //       ),
      //       TaskFormState(
      //         content: 'Content'.toTextInput(),
      //         validity: Formsz.valid(),
      //         saveState: SubmitState.success(),
      //         isEditing: false,
      //       ),
      //     ],
      //     verify: (_) {
      //       verify(() => mockTaskRepository.createTask(any())).called(1);
      //     },
      //   );
    });

    group('contentChanged', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'updates content and validity',
        build: () => taskFormBloc,
        act: (bloc) => bloc.contentChanged('New Content'),
        expect: () => [
          TaskFormState(
            content: 'New Content'.toTextInput(),
            validity: taskFormBloc.state
                .validateWith(content: 'New Content'.toTextInput()),
          ),
        ],
      );
    });

    group('descriptionChanged', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'updates description and validity',
        build: () => taskFormBloc,
        act: (bloc) => bloc.descriptionChanged('New Description'),
        expect: () => [
          TaskFormState(
            description: 'New Description'.toTextInput(),
            validity: taskFormBloc.state.validateWith(
              description: 'New Description'.toTextInput(),
            ),
          ),
        ],
      );
    });

    group('durationChanged', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'updates duration and validity',
        build: () => taskFormBloc,
        act: (bloc) => bloc.durationChanged('10'),
        expect: () => [
          TaskFormState(
            duration: '10'.toPositiveInt(),
            validity:
                taskFormBloc.state.validateWith(duration: '10'.toPositiveInt()),
          ),
        ],
      );
    });

    group('durationUnitChanged', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'updates duration unit and validity',
        build: () => taskFormBloc,
        act: (bloc) => bloc.durationUnitChanged('day'),
        expect: () => [
          TaskFormState(
            durationUnit: DurationUnit.day.toFormInput(),
            validity: taskFormBloc.state.validateWith(
              durationUnit: DurationUnit.day.toFormInput(),
            ),
          ),
        ],
      );
    });

    group('sectionIdChanged', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'updates sectionId and validity',
        build: () => taskFormBloc,
        act: (bloc) => bloc.sectionIdChanged('new-section-id'),
        expect: () => [
          TaskFormState(
            sectionId: 'new-section-id'.toTextInput(),
            validity: taskFormBloc.state
                .validateWith(sectionId: 'new-section-id'.toTextInput()),
          ),
        ],
      );
    });

    group('initSectionId', () {
      blocTest<TaskFormBloc, TaskFormState>(
        'initializes sectionId if empty',
        build: () => taskFormBloc,
        act: (bloc) => bloc.initSectionId('initial-section-id'),
        seed: () => const TaskFormState(),
        expect: () => [
          TaskFormState(
            sectionId: 'initial-section-id'.toPureTextInput(),
          ),
        ],
      );
    });
  });
}
