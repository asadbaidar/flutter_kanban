import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRemoteDataSource extends Mock implements TaskRemoteDataSource {}

void main() {
  late TaskRepositoryImpl repository;
  late MockTaskRemoteDataSource mockDataSource;

  setUpAll(() {
    registerFallbackValue(const TaskDtoEntity());
  });

  setUp(() {
    mockDataSource = MockTaskRemoteDataSource();
    repository = TaskRepositoryImpl(dataSource: mockDataSource);
  });

  group('TaskRepositoryImpl', () {
    test('should return TaskData on getTasks', () async {
      const projectId = 'project123';
      const jsonResponse = TaskDataEntity(
        all: [
          TaskEntity(id: 'task1', content: 'Task 1'),
          TaskEntity(id: 'task2', content: 'Task 2'),
        ],
      );
      const expectedResponse = TaskData(
        all: {
          '': [
            Task(
              id: 'task1',
              content: 'Task 1',
            ),
            Task(
              id: 'task2',
              content: 'Task 2',
            ),
          ],
        },
      );

      when(() => mockDataSource.getTasks(projectId))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.getTasks(projectId);

      expect(result, expectedResponse);
      verify(() => mockDataSource.getTasks(projectId)).called(1);
    });

    test('should handle empty TaskData on getTasks', () async {
      const projectId = 'project123';
      const jsonResponse = TaskDataEntity(all: []);

      when(() => mockDataSource.getTasks(projectId))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.getTasks(projectId);

      expect(result.all, isEmpty);
      verify(() => mockDataSource.getTasks(projectId)).called(1);
    });

    test('should throw exception on getTasks failure', () async {
      const projectId = 'project123';

      when(() => mockDataSource.getTasks(projectId))
          .thenThrow(Exception('Failed to fetch tasks'));

      expect(
        () async => await repository.getTasks(projectId),
        throwsA(isA<Exception>()),
      );
      verify(() => mockDataSource.getTasks(projectId)).called(1);
    });

    test('should create a Task successfully', () async {
      const dto = TaskDto(content: 'New Task');
      const jsonResponse = TaskEntity(id: 'task123', content: 'New Task');
      const expectedResponse = Task(id: 'task123', content: 'New Task');

      when(() => mockDataSource.createTask(any()))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.createTask(dto);

      expect(result, expectedResponse);
      verify(() => mockDataSource.createTask(any())).called(1);
    });

    test('should update a Task successfully', () async {
      const id = 'task123';
      const dto = TaskDto(content: 'Updated Task');
      const jsonResponse = TaskEntity(id: 'task123', content: 'Updated Task');
      const expectedResponse = Task(id: 'task123', content: 'Updated Task');

      when(() => mockDataSource.updateTask(any(), any()))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.updateTask(id, dto);

      expect(result, expectedResponse);
      verify(() => mockDataSource.updateTask(any(), any())).called(1);
    });

    test('should move a Task successfully', () async {
      const id = 'task123';
      const sectionId = 'section456';

      when(() => mockDataSource.moveTask(id: id, sectionId: sectionId))
          .thenAnswer((_) async {});
      await repository.moveTask(id: id, sectionId: sectionId);
      verify(() => mockDataSource.moveTask(id: id, sectionId: sectionId))
          .called(1);
    });

    test('should close a Task successfully', () async {
      const id = 'task123';

      when(() => mockDataSource.closeTask(id)).thenAnswer((_) async {});
      await repository.closeTask(id);
      verify(() => mockDataSource.closeTask(id)).called(1);
    });

    test('should reopen a Task successfully', () async {
      const id = 'task123';

      when(() => mockDataSource.reopenTask(id)).thenAnswer((_) async {});
      await repository.reopenTask(id);
      verify(() => mockDataSource.reopenTask(id)).called(1);
    });

    test('should return completed tasks on getCompletedTasks', () async {
      const projectId = 'project123';
      const jsonResponse = [
        TaskCompletedEntity(taskId: 'task1', content: 'Task 1'),
        TaskCompletedEntity(taskId: 'task2', content: 'Task 2'),
      ];
      const expectedResponse = [
        TaskCompleted(taskId: 'task1', content: 'Task 1'),
        TaskCompleted(taskId: 'task2', content: 'Task 2'),
      ];

      when(() => mockDataSource.getCompletedTasks(projectId))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.getCompletedTasks(projectId);

      expect(result, expectedResponse);
      verify(() => mockDataSource.getCompletedTasks(projectId)).called(1);
    });

    test('should handle empty completed tasks on getCompletedTasks', () async {
      const projectId = 'project123';
      const jsonResponse = <TaskCompletedEntity>[];

      when(() => mockDataSource.getCompletedTasks(projectId))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.getCompletedTasks(projectId);

      expect(result, isEmpty);
      verify(() => mockDataSource.getCompletedTasks(projectId)).called(1);
    });

    test('should throw exception on getCompletedTasks failure', () async {
      const projectId = 'project123';

      when(() => mockDataSource.getCompletedTasks(projectId))
          .thenThrow(Exception('Failed to fetch completed tasks'));

      expect(
        () async => await repository.getCompletedTasks(projectId),
        throwsA(isA<Exception>()),
      );
      verify(() => mockDataSource.getCompletedTasks(projectId)).called(1);
    });
  });
}
