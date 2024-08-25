import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSectionRemoteDataSource extends Mock
    implements SectionRemoteDataSource {}

void main() {
  late SectionRepositoryImpl repository;
  late MockSectionRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockSectionRemoteDataSource();
    repository = SectionRepositoryImpl(dataSource: mockDataSource);
  });

  group('SectionRepositoryImpl', () {
    test('should return list of sections successfully', () async {
      const projectId = 'project123';
      final jsonResponse = [
        {
          'id': 'section1',
          'projectId': projectId,
          'order': 1,
          'name': 'Section 1',
        },
        {
          'id': 'section2',
          'projectId': projectId,
          'order': 2,
          'name': 'Section 2',
        },
      ];

      final list = jsonResponse.map((e) => SectionEntity.fromJson(e)).toList();

      when(() => mockDataSource.getSections(projectId))
          .thenAnswer((_) async => list);

      final result = await repository.getSections(projectId);

      expect(result.length, 2);
      expect(result[0].id, 'section1');
      expect(result[1].name, 'Section 2');
      verify(() => mockDataSource.getSections(projectId)).called(1);
    });

    test('should handle empty response', () async {
      const projectId = 'project123';
      final List<SectionEntity> list = [];

      when(() => mockDataSource.getSections(projectId))
          .thenAnswer((_) async => list);

      final result = await repository.getSections(projectId);

      expect(result, isEmpty);
      verify(() => mockDataSource.getSections(projectId)).called(1);
    });

    test('should handle errors', () async {
      const projectId = 'project123';

      when(() => mockDataSource.getSections(projectId))
          .thenThrow(Exception('Failed to fetch sections'));

      expect(
        () async => await repository.getSections(projectId),
        throwsA(isA<Exception>()),
      );
      verify(() => mockDataSource.getSections(projectId)).called(1);
    });
  });
}
