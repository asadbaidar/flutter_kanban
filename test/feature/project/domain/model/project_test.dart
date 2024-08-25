import 'package:core/feature/project/project.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Project', () {
    test('supports value comparison', () {
      const project1 = Project(id: '1', name: 'Project 1');
      const project2 = Project(id: '1', name: 'Project 1');
      const project3 = Project(id: '2', name: 'Project 2');

      // Value comparison (equality)
      expect(project1, equals(project2));
      expect(project1, isNot(equals(project3)));
    });

    test('toString returns correct value', () {
      const project = Project(id: '1', name: 'Project 1');
      expect(
        project.toString(),
        equals(
          'Project(id: 1, name: Project 1, commentCount: null, order: null, color: null, isShared: null, isFavorite: null, isInboxProject: null, isTeamInbox: null, viewStyle: null, url: null, parentId: null)',
        ),
      );
    });

    test('copyWith returns new object with updated values', () {
      const project = Project(id: '1', name: 'Project 1');
      final updatedProject = project.copyWith(name: 'Updated Project 1');

      expect(updatedProject.name, equals('Updated Project 1'));
      expect(updatedProject.id, equals('1'));
      expect(updatedProject, isNot(equals(project)));
    });

    test('copyWith returns the same object when no values are changed', () {
      const project = Project(id: '1', name: 'Project 1');
      final updatedProject = project.copyWith();

      expect(updatedProject, equals(project));
    });

    test('handles null values correctly', () {
      const project = Project();

      expect(project.id, isNull);
      expect(project.name, isNull);
      expect(project.commentCount, isNull);
      expect(project.order, isNull);
      expect(project.color, isNull);
      expect(project.isShared, isNull);
      expect(project.isFavorite, isNull);
      expect(project.isInboxProject, isNull);
      expect(project.isTeamInbox, isNull);
      expect(project.viewStyle, isNull);
      expect(project.url, isNull);
      expect(project.parentId, isNull);
    });
  });
}
