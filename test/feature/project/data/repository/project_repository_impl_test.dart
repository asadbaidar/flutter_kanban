import 'package:core/feature/project/project.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectRemoteDataSource extends Mock
    implements ProjectRemoteDataSource {}

class MockProjectEntity extends Mock implements ProjectEntity {}

class MockProject extends Mock implements Project {}

void main() {
  late MockProjectRemoteDataSource mockDataSource;
  late ProjectRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockProjectRemoteDataSource();
    repository = ProjectRepositoryImpl(dataSource: mockDataSource);
  });

  group('getProjects', () {
    test('returns a list of Projects excluding inbox projects', () async {
      final projectEntity1 = MockProjectEntity();
      final projectEntity2 = MockProjectEntity();
      final projectEntity3 = MockProjectEntity();

      when(() => projectEntity1.isInboxProject).thenReturn(false);
      when(() => projectEntity2.isInboxProject).thenReturn(true);
      when(() => projectEntity3.isInboxProject).thenReturn(false);

      final project1 = MockProject();
      final project3 = MockProject();

      when(() => projectEntity1.toModel()).thenReturn(project1);
      when(() => projectEntity3.toModel()).thenReturn(project3);

      when(() => mockDataSource.getProjects()).thenAnswer(
        (_) async => [projectEntity1, projectEntity2, projectEntity3],
      );

      final result = await repository.getProjects();

      expect(result.length, 2);
      expect(result, containsAll([project1, project3]));
      verify(() => mockDataSource.getProjects()).called(1);
    });

    test('returns an empty list when all projects are inbox projects',
        () async {
      final projectEntity1 = MockProjectEntity();
      final projectEntity2 = MockProjectEntity();

      when(() => projectEntity1.isInboxProject).thenReturn(true);
      when(() => projectEntity2.isInboxProject).thenReturn(true);

      when(() => mockDataSource.getProjects()).thenAnswer(
        (_) async => [projectEntity1, projectEntity2],
      );

      final result = await repository.getProjects();

      expect(result, isEmpty);
      verify(() => mockDataSource.getProjects()).called(1);
    });

    test('handles empty data source correctly', () async {
      when(() => mockDataSource.getProjects()).thenAnswer(
        (_) async => [],
      );

      final result = await repository.getProjects();

      expect(result, isEmpty);
      verify(() => mockDataSource.getProjects()).called(1);
    });

    test('handles null isInboxProject correctly', () async {
      final projectEntity1 = MockProjectEntity();
      final projectEntity2 = MockProjectEntity();

      when(() => projectEntity1.isInboxProject).thenReturn(null);
      when(() => projectEntity2.isInboxProject).thenReturn(false);

      final project1 = MockProject();
      final project2 = MockProject();

      when(() => projectEntity1.toModel()).thenReturn(project1);
      when(() => projectEntity2.toModel()).thenReturn(project2);

      when(() => mockDataSource.getProjects()).thenAnswer(
        (_) async => [projectEntity1, projectEntity2],
      );

      final result = await repository.getProjects();

      expect(result.length, 2);
      expect(result, containsAll([project1, project2]));
      verify(() => mockDataSource.getProjects()).called(1);
    });
  });
}
