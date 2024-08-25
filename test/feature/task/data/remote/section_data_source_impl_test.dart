import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late SectionRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = SectionRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  group('SectionRemoteDataSourceImpl', () {
    test('should return a list of SectionEntity when getSections is successful',
        () async {
      final jsonResponse = [
        {
          'id': 'section1',
          'project_id': 'project1',
          'order': 1,
          'name': 'Section 1',
        },
        {
          'id': 'section2',
          'project_id': 'project1',
          'order': 2,
          'name': 'Section 2',
        },
      ];

      when(
        () => mockHttpClient.get<JsonArray>(
          path: TaskEndpoints.sections,
          query: {'project_id': 'project1'},
        ),
      ).thenAnswer((_) async => jsonResponse);

      final sections = await dataSource.getSections('project1');

      expect(sections, isA<List<SectionEntity>>());
      expect(sections.length, 2);
      expect(sections[0].id, 'section1');
      expect(sections[1].id, 'section2');
    });

    test('should handle an empty response', () async {
      when(
        () => mockHttpClient.get<JsonArray>(
          path: TaskEndpoints.sections,
          query: {'project_id': 'project1'},
        ),
      ).thenAnswer((_) async => []);

      final sections = await dataSource.getSections('project1');

      expect(sections, isA<List<SectionEntity>>());
      expect(sections.isEmpty, true);
    });

    test('should throw an exception on HTTP client failure', () async {
      when(
        () => mockHttpClient.get<JsonArray>(
          path: TaskEndpoints.sections,
          query: {'project_id': 'project1'},
        ),
      ).thenThrow(Exception('Failed to load'));

      expect(
        () async => dataSource.getSections('project1'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
