import 'package:common/common.dart';
import 'package:core/feature/task/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockEnvironment extends Mock implements Environment {
  @override
  String get syncUrl => 'http://example.com';
}

void main() {
  late TaskRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  late MockEnvironment mockEnvironment;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockEnvironment = MockEnvironment();
    dataSource = TaskRemoteDataSourceImpl(
      httpClient: mockHttpClient,
      environment: mockEnvironment,
    );
  });

  group('TaskRemoteDataSourceImpl', () {
    test('should fetch tasks successfully', () async {
      const projectId = 'project123';
      final jsonResponse = [
        {'id': 'task1', 'content': 'Task 1'},
        {'id': 'task2', 'content': 'Task 2'},
      ];

      when(
        () => mockHttpClient.get<JsonArray>(
          path: TaskEndpoints.tasks,
          query: {'project_id': projectId},
        ),
      ).thenAnswer((_) async => jsonResponse);

      final result = await dataSource.getTasks(projectId);

      expect(result.all?.length, 2);
      expect(result.all?.first.id, 'task1');
      verify(
        () => mockHttpClient.get<JsonArray>(
          path: TaskEndpoints.tasks,
          query: {'project_id': projectId},
        ),
      ).called(1);
    });

    test('should create a task successfully', () async {
      final dto = TaskDtoEntity(content: 'New Task');
      final jsonResponse = {'id': 'task123', 'content': 'New Task'};

      when(
        () => mockHttpClient.post<JsonObject>(
          path: TaskEndpoints.tasks,
          body: dto.toJson(),
        ),
      ).thenAnswer((_) async => jsonResponse);

      final result = await dataSource.createTask(dto);

      expect(result.id, 'task123');
      expect(result.content, 'New Task');
      verify(
        () => mockHttpClient.post<JsonObject>(
          path: TaskEndpoints.tasks,
          body: dto.toJson(),
        ),
      ).called(1);
    });

    test('should update a task successfully', () async {
      const id = 'task123';
      final dto = TaskDtoEntity(content: 'Updated Task');
      final jsonResponse = {'id': 'task123', 'content': 'Updated Task'};

      when(
        () => mockHttpClient.post<JsonObject>(
          path: TaskEndpoints.tasks.suffix('/$id'),
          body: dto.toJson(),
        ),
      ).thenAnswer((_) async => jsonResponse);

      final result = await dataSource.updateTask(id, dto);

      expect(result.id, 'task123');
      expect(result.content, 'Updated Task');
      verify(
        () => mockHttpClient.post<JsonObject>(
          path: TaskEndpoints.tasks.suffix('/$id'),
          body: dto.toJson(),
        ),
      ).called(1);
    });

    test('should move a task successfully', () async {
      const id = 'task123';
      const sectionId = 'section456';

      when(
        () => mockHttpClient.post<void>(
          baseUrl: any(named: 'baseUrl'),
          path: any(named: 'path'),
          formData: any(named: 'formData'),
        ),
      ).thenAnswer((_) async {});

      await dataSource.moveTask(id: id, sectionId: sectionId);

      verify(
        () => mockHttpClient.post<void>(
          baseUrl: any(named: 'baseUrl'),
          path: any(named: 'path'),
          formData: any(named: 'formData'),
        ),
      ).called(1);
    });
  });
}
