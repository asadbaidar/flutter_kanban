import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SectionEntity', () {
    test('fromJson should return a valid SectionEntity', () {
      final json = {
        'id': '123',
        'project_id': '456',
        'order': 1,
        'name': 'Test Section',
      };

      final sectionEntity = SectionEntity.fromJson(json);

      expect(sectionEntity.id, '123');
      expect(sectionEntity.projectId, '456');
      expect(sectionEntity.order, 1);
      expect(sectionEntity.name, 'Test Section');
    });

    test('fromJson with null values should handle gracefully', () {
      final json = {
        'id': null,
        'project_id': null,
        'order': null,
        'name': null,
      };

      final sectionEntity = SectionEntity.fromJson(json);

      expect(sectionEntity.id, null);
      expect(sectionEntity.projectId, null);
      expect(sectionEntity.order, null);
      expect(sectionEntity.name, null);
    });

    test('fromJson with missing fields should handle gracefully', () {
      final Map<String, dynamic> json = {};

      final sectionEntity = SectionEntity.fromJson(json);

      expect(sectionEntity.id, null);
      expect(sectionEntity.projectId, null);
      expect(sectionEntity.order, null);
      expect(sectionEntity.name, null);
    });

    test('toJson should return a valid JSON map', () {
      final sectionEntity = SectionEntity(
        id: '123',
        projectId: '456',
        order: 1,
        name: 'Test Section',
      );

      final json = sectionEntity.toJson();

      expect(json['id'], '123');
      expect(json['project_id'], '456');
      expect(json['order'], 1);
      expect(json['name'], 'Test Section');
    });

    test('toModel should convert SectionEntity to Section', () {
      final sectionEntity = SectionEntity(
        id: '123',
        projectId: '456',
        order: 1,
        name: 'Test Section',
      );

      final section = sectionEntity.toModel();

      expect(section.id, '123');
      expect(section.projectId, '456');
      expect(section.order, 1);
      expect(section.name, 'Test Section');
    });
  });
}
