import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskCompleted', () {
    test('factory should create an instance with given parameters', () {
      final taskCompleted = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
        content: 'Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      expect(taskCompleted.completedAt, DateTime.parse('2024-08-25T12:34:56Z'));
      expect(taskCompleted.content, 'Task Content');
      expect(taskCompleted.projectId, 'project_123');
      expect(taskCompleted.sectionId, 'section_123');
      expect(taskCompleted.taskId, 'task_123');
    });

    test('factory should handle null values correctly', () {
      const taskCompleted = TaskCompleted();

      expect(taskCompleted.completedAt, null);
      expect(taskCompleted.content, null);
      expect(taskCompleted.projectId, null);
      expect(taskCompleted.sectionId, null);
      expect(taskCompleted.taskId, null);
    });

    test('copyWith should create a new TaskCompleted with updated values', () {
      final taskCompleted = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
        content: 'Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      final updatedTaskCompleted = taskCompleted.copyWith(
        content: 'Updated Task Content',
      );

      expect(updatedTaskCompleted.content, 'Updated Task Content');
      expect(updatedTaskCompleted.completedAt, taskCompleted.completedAt);
      expect(updatedTaskCompleted.projectId, taskCompleted.projectId);
      expect(updatedTaskCompleted.sectionId, taskCompleted.sectionId);
      expect(updatedTaskCompleted.taskId, taskCompleted.taskId);
    });

    test('equality comparison of two TaskCompleted instances', () {
      final taskCompleted1 = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
        content: 'Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      final taskCompleted2 = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
        content: 'Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      final taskCompleted3 = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
        content: 'Different Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      expect(taskCompleted1, equals(taskCompleted2));
      expect(taskCompleted1, isNot(equals(taskCompleted3)));
    });

    test('completedAtFormmated should return correct formatted string', () {
      final taskCompleted = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
      );

      expect(
        taskCompleted.completedAtFormmated,
        'Completed at Aug 25, 2024, 12:34PM',
      );
    });

    test(
        'taskByCompletion should compare two TaskCompleted instances correctly',
        () {
      final taskA = TaskCompleted(
        completedAt: DateTime.parse('2024-08-25T12:34:56Z'),
      );
      final taskB = TaskCompleted(
        completedAt: DateTime.parse('2023-08-25T12:34:56Z'),
      );

      expect(taskByCompletion(taskA, taskB), -1);
      expect(taskByCompletion(taskB, taskA), 1);
    });

    test('taskByCompletion should handle null completedAt values correctly',
        () {
      const taskA = TaskCompleted();
      final taskB = TaskCompleted(
        completedAt: DateTime.parse('2023-08-25T12:34:56Z'),
      );

      expect(taskByCompletion(taskA, taskB), 0);
      expect(taskByCompletion(taskB, taskA), 0);
    });
  });
}
