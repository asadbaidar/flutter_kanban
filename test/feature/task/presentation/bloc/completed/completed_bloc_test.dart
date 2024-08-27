import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late TaskCompletedBloc taskCompletedBloc;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    taskCompletedBloc = TaskCompletedBloc(taskRepository: mockTaskRepository);
  });

  group('TaskCompletedBloc', () {
    test('initial state is TaskCompletedState()', () {
      expect(taskCompletedBloc.state, const TaskCompletedState());
    });

    group('getCompletedTasks', () {
      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'emits loading and then new state with completed tasks when getCompletedTasks is successful',
        build: () {
          when(() => mockTaskRepository.getCompletedTasks(any())).thenAnswer(
            (_) async => [const TaskCompleted(taskId: '1')],
          );
          return taskCompletedBloc;
        },
        act: (bloc) => bloc.getCompletedTasks(),
        expect: () => [
          const TaskCompletedState(dataState: Data.loading()),
          const TaskCompletedState(
            dataState: Data.loaded(
              value: [
                TaskCompleted(taskId: '1'),
              ],
            ),
          ),
        ],
      );

      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'emits loading and then failure when getCompletedTasks throws an error',
        build: () {
          when(() => mockTaskRepository.getCompletedTasks(any()))
              .thenThrow('Failed to load completed tasks');
          return taskCompletedBloc;
        },
        act: (bloc) => bloc.getCompletedTasks(),
        expect: () => [
          const TaskCompletedState(dataState: Data.loading()),
          const TaskCompletedState(
            dataState: Data.failure(error: 'Failed to load completed tasks'),
          ),
        ],
      );
    });

    group('projectChanged', () {
      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'calls getCompletedTasks when project is changed',
        build: () {
          when(() => mockTaskRepository.getCompletedTasks(any())).thenAnswer(
            (_) async => [const TaskCompleted(taskId: '1')],
          );
          return taskCompletedBloc;
        },
        act: (bloc) {
          bloc.projectChanged(const Project(id: 'project1')); // Project change
        },
        verify: (_) {
          verify(() => mockTaskRepository.getCompletedTasks('project1'))
              .called(1);
        },
      );

      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'does not call getCompletedTasks if project is not changed',
        build: () {
          when(() => mockTaskRepository.getCompletedTasks(any())).thenAnswer(
            (_) async => [const TaskCompleted(taskId: '1')],
          );
          return taskCompletedBloc;
        },
        act: (bloc) {
          bloc.projectChanged(null); // No project change
          bloc.projectChanged(const Project(id: 'project1'));
          bloc.projectChanged(const Project(id: 'project1')); // No change
        },
        verify: (_) {
          verify(() => mockTaskRepository.getCompletedTasks(any())).called(1);
        },
      );
    });

    group('reopenTask', () {
      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'emits new state with reopened task when reopenTask is successful',
        build: () {
          when(() => mockTaskRepository.reopenTask(any()))
              .thenAnswer((_) async {});
          return taskCompletedBloc;
        },
        act: (bloc) => bloc.reopenTask('1'),
        expect: () => [
          const TaskCompletedState(reopenState: Data.loading(key: '1')),
          const TaskCompletedState(reopenState: Data.loaded(key: '1')),
        ],
      );

      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'emits loading and then failure when reopenTask throws an error',
        build: () {
          when(() => mockTaskRepository.reopenTask(any()))
              .thenThrow('Failed to reopen task');
          return taskCompletedBloc;
        },
        act: (bloc) => bloc.reopenTask('1'),
        expect: () => [
          const TaskCompletedState(reopenState: Data.loading(key: '1')),
          const TaskCompletedState(
            reopenState: Data.failure(key: '1', error: 'Failed to reopen task'),
          ),
        ],
      );
    });

    group('closeTask', () {
      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'emits new state with closed task when closeTask is successful',
        build: () {
          when(() => mockTaskRepository.closeTask(any()))
              .thenAnswer((_) async {});
          return taskCompletedBloc;
        },
        act: (bloc) => bloc.closeTask('1'),
        expect: () => [
          const TaskCompletedState(closeState: Data.loading(key: '1')),
          const TaskCompletedState(closeState: Data.loaded(key: '1')),
        ],
      );

      blocTest<TaskCompletedBloc, TaskCompletedState>(
        'emits loading and then failure when closeTask throws an error',
        build: () {
          when(() => mockTaskRepository.closeTask(any()))
              .thenThrow('Failed to close task');
          return taskCompletedBloc;
        },
        act: (bloc) => bloc.closeTask('1'),
        expect: () => [
          const TaskCompletedState(closeState: Data.loading(key: '1')),
          const TaskCompletedState(
            closeState: Data.failure(key: '1', error: 'Failed to close task'),
          ),
        ],
      );
    });
  });
}
