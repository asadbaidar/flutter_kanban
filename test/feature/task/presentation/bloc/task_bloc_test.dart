import 'package:bloc_test/bloc_test.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late TaskBloc taskBloc;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    taskBloc = TaskBloc(taskRepository: mockTaskRepository);
  });

  group('TaskBloc', () {
    test('initial state is TaskState()', () {
      expect(taskBloc.state, const TaskState());
    });

    blocTest<TaskBloc, TaskState>(
      'emits loading and then new state with tasks when getTasks is successful',
      build: () {
        when(() => mockTaskRepository.getTasks(any())).thenAnswer(
          (_) async => const TaskData(
            all: {
              'section1': [Task(id: '1')],
            },
          ),
        );
        return taskBloc;
      },
      act: (bloc) => bloc.getTasks(),
      expect: () => [
        const TaskState(dataState: TaskDataState.loading()),
        const TaskState(
          dataState: TaskDataState.loaded(
            value: TaskData(
              all: {
                'section1': [Task(id: '1')],
              },
            ),
          ),
        ),
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'emits loading and then failure when getTasks throws an error',
      build: () {
        when(() => mockTaskRepository.getTasks(any()))
            .thenThrow('Failed to load tasks');
        return taskBloc;
      },
      act: (bloc) => bloc.getTasks(),
      expect: () => [
        const TaskState(dataState: TaskDataState.loading()),
        const TaskState(
          dataState: TaskDataState.failure(error: 'Failed to load tasks'),
        ),
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'calls getTasks when project is changed',
      build: () {
        when(() => mockTaskRepository.getTasks(any())).thenAnswer(
          (_) async => const TaskData(
            all: {
              'section1': [Task(id: '1')],
            },
          ),
        );
        return taskBloc;
      },
      act: (bloc) {
        bloc.projectChanged(const Project(id: 'project1')); // Project change
      },
      verify: (_) {
        verify(() => mockTaskRepository.getTasks('project1')).called(1);
      },
    );

    blocTest<TaskBloc, TaskState>(
      'does not call getTasks if project is not changed',
      build: () {
        when(() => mockTaskRepository.getTasks(any())).thenAnswer(
          (_) async => const TaskData(
            all: {
              'section1': [Task(id: '1')],
            },
          ),
        );
        return taskBloc;
      },
      act: (bloc) {
        bloc.projectChanged(null); // No project change
        bloc.projectChanged(const Project(id: 'project1'));
        bloc.projectChanged(const Project(id: 'project1')); // No change
      },
      verify: (_) {
        verify(() => mockTaskRepository.getTasks(any())).called(1);
      },
    );

    test('onDragStart updates state with dragging task', () {
      const task = Task(id: '1');
      taskBloc.onDragStart(task);
      expect(taskBloc.state.draggingTask, task);
    });

    test('onDragEnd clears dragging task', () {
      taskBloc.onDragEnd();
      expect(taskBloc.state.draggingTask, null);
    });
  });
}
