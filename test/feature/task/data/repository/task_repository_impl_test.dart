import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRemoteDataSource extends Mock implements TaskRemoteDataSource {}

void main() {
  late TaskRepositoryImpl repository;
  late MockTaskRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockTaskRemoteDataSource();
    repository = TaskRepositoryImpl(dataSource: mockDataSource);
  });

  group('TaskRepositoryImpl', () {
    test('should return TaskData on getTasks', () async {
      const projectId = 'project123';
      final jsonResponse = TaskDataEntity(
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
      final jsonResponse = TaskDataEntity(all: []);

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
      final dto = TaskDto(
        content: 'Updated Content',
        description: 'Task Description',
        sectionId: 'section_123',
        labels: ['label1', 'label2'],
        priority: 5,
        dueString: '2024-08-25',
        dueDate: '2024-08-25',
        dueDatetime: DateTime.parse('2024-08-25T12:34:56Z'),
        assigneeId: 'user_123',
        duration: '60',
        durationUnit: DurationUnit.minute,
      );
      final dtoEntity = TaskDtoEntity.fromModel(dto);
      final jsonResponse = TaskEntity(id: 'task123', content: 'Updated Task');
      const expectedResponse = Task(
        id: 'task123',
        content: 'New Task',
      );

      when(() => mockDataSource.createTask(dtoEntity))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.createTask(dto);

      expect(result, expectedResponse);
      verify(() => mockDataSource.createTask(dtoEntity)).called(1);
    });

    test('should update a Task successfully', () async {
      const id = 'task123';
      const dto = TaskDto(
        content: 'Updated Task',
      );
      final dtoEntity = TaskDtoEntity.fromModel(dto);
      final jsonResponse = TaskEntity(id: 'task123', content: 'Updated Task');
      const expectedResponse = Task(id: 'task123', content: 'Updated Task');

      when(() => mockDataSource.updateTask(id, dtoEntity))
          .thenAnswer((_) async => jsonResponse);

      final result = await repository.updateTask(id, dto);

      expect(result, expectedResponse);
      verify(() => mockDataSource.updateTask(id, dtoEntity)).called(1);
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
  });
}
