import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Section', () {
    test('copyWith creates a new Section with updated values', () {
      const section = Section(
        id: '1',
        projectId: 'project1',
        order: 1,
        name: 'Section A',
      );

      final updatedSection = section.copyWith(
        name: 'Updated Section A',
      );

      expect(updatedSection.id, '1');
      expect(updatedSection.projectId, 'project1');
      expect(updatedSection.order, 1);
      expect(updatedSection.name, 'Updated Section A');
    });

    test('equality comparison checks equality of two Sections', () {
      const section1 = Section(
        id: '1',
        projectId: 'project1',
        order: 1,
        name: 'Section A',
      );

      const section2 = Section(
        id: '1',
        projectId: 'project1',
        order: 1,
        name: 'Section A',
      );

      const section3 = Section(
        id: '2',
        projectId: 'project2',
        order: 2,
        name: 'Section B',
      );

      expect(section1, section2);
      expect(section1, isNot(section3));
    });

    test('hashCode is consistent with equality', () {
      const section1 = Section(
        id: '1',
        projectId: 'project1',
        order: 1,
        name: 'Section A',
      );

      const section2 = Section(
        id: '1',
        projectId: 'project1',
        order: 1,
        name: 'Section A',
      );

      expect(section1.hashCode, section2.hashCode);
    });

    test('toString provides a readable representation', () {
      const section = Section(
        id: '1',
        projectId: 'project1',
        order: 1,
        name: 'Section A',
      );

      expect(
        section.toString(),
        'Section(id: 1, projectId: project1, order: 1, name: Section A)',
      );
    });
  });
}
