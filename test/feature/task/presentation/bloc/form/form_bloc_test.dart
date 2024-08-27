import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late TaskFormBloc taskFormBloc;

  setUpAll(() {
    registerFallbackValue(const Task());
    registerFallbackValue(const TaskDto());
  });

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    taskFormBloc = TaskFormBloc(taskRepository: mockTaskRepository);
  });

  group('TaskFormBloc', () {
    test('initial state is correct', () {
      expect(taskFormBloc.state, equals(const TaskFormState()));
    });

    group('save', () {
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

      const taskToEdit = Task(id: '1', content: 'Old Content');

      blocTest<TaskFormBloc, TaskFormState>(
        'calls updateTask when editing and state is validated',
        setUp: () {
          when(() => mockTaskRepository.updateTask('1', any()))
              .thenAnswer((_) async => const Task(id: '1', content: 'Content'));
        },
        build: () => TaskFormBloc(
          taskRepository: mockTaskRepository,
          task: taskToEdit,
        ),
        seed: () => TaskFormState(
          content: 'Content'.toTextInput(),
          validity: FormzStatus.valid,
          task: taskToEdit,
        ),
        act: (bloc) async => await bloc.save(),
        expect: () => [
          TaskFormState(
            content: 'Content'.toTextInput(),
            validity: FormzStatus.valid,
            saveState: const Data.loading(),
            task: taskToEdit,
          ),
          TaskFormState(
            content: 'Content'.toTextInput(),
            validity: FormzStatus.valid,
            saveState:
                const Data.loaded(value: Task(id: '1', content: 'Content')),
            task: taskToEdit,
          ),
        ],
        verify: (_) {
          verify(() => mockTaskRepository.updateTask('1', any())).called(1);
        },
      );

      blocTest<TaskFormBloc, TaskFormState>(
        'calls createTask when not editing and state is validated',
        setUp: () {
          when(() => mockTaskRepository.createTask(any()))
              .thenAnswer((_) async => const Task(id: '1', content: 'Content'));
        },
        build: () {
          return TaskFormBloc(
            taskRepository: mockTaskRepository,
          );
        },
        seed: () => TaskFormState(
          content: 'Content'.toTextInput(),
          validity: FormzStatus.valid,
        ),
        act: (bloc) async => await bloc.save(),
        expect: () => [
          TaskFormState(
            content: 'Content'.toTextInput(),
            validity: FormzStatus.valid,
            saveState: const Data.loading(),
          ),
          TaskFormState(
            content: 'Content'.toTextInput(),
            validity: FormzStatus.valid,
            saveState:
                const Data.loaded(value: Task(id: '1', content: 'Content')),
          ),
        ],
        verify: (_) {
          verify(() => mockTaskRepository.createTask(any())).called(1);
        },
      );

      blocTest<TaskFormBloc, TaskFormState>(
        'catches error when saving task fails',
        setUp: () {
          when(() => mockTaskRepository.createTask(any()))
              .thenThrow('Failed to save task');
        },
        build: () {
          return TaskFormBloc(
            taskRepository: mockTaskRepository,
          );
        },
        seed: () => TaskFormState(
          content: 'Content'.toTextInput(),
          validity: FormzStatus.valid,
        ),
        act: (bloc) async => await bloc.save(),
        expect: () => [
          TaskFormState(
            content: 'Content'.toTextInput(),
            validity: FormzStatus.valid,
            saveState: const Data.loading(),
          ),
          TaskFormState(
            content: 'Content'.toTextInput(),
            validity: FormzStatus.valid,
            saveState: const Data.failure(error: 'Failed to save task'),
          ),
        ],
        verify: (_) {
          verify(() => mockTaskRepository.createTask(any())).called(1);
        },
      );
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
            validity: taskFormBloc.state
                .validateWith(description: 'New Description'.toTextInput()),
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
            durationUnit: DurationUnit.day.nullable.toFormInput(),
            validity: taskFormBloc.state.validateWith(
              durationUnit: DurationUnit.day.nullable.toFormInput(),
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
