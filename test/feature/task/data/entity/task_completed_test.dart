import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskCompletedEntity', () {
    test('fromJson should return a valid TaskCompletedEntity', () {
      const json = {
        'completed_at': '2024-08-25T12:34:56Z',
        'content': 'Task Content',
        'project_id': 'project_123',
        'section_id': 'section_123',
        'task_id': 'task_123',
      };

      final taskCompletedEntity = TaskCompletedEntity.fromJson(json);

      expect(taskCompletedEntity.completedAt, '2024-08-25T12:34:56Z');
      expect(taskCompletedEntity.content, 'Task Content');
      expect(taskCompletedEntity.projectId, 'project_123');
      expect(taskCompletedEntity.sectionId, 'section_123');
      expect(taskCompletedEntity.taskId, 'task_123');
    });

    test('fromJson with null values should handle gracefully', () {
      const json = {
        'completed_at': null,
        'content': null,
        'project_id': null,
        'section_id': null,
        'task_id': null,
      };

      final taskCompletedEntity = TaskCompletedEntity.fromJson(json);

      expect(taskCompletedEntity.completedAt, null);
      expect(taskCompletedEntity.content, null);
      expect(taskCompletedEntity.projectId, null);
      expect(taskCompletedEntity.sectionId, null);
      expect(taskCompletedEntity.taskId, null);
    });

    test('fromJson with missing fields should handle gracefully', () {
      final Map<String, dynamic> json = {};

      final taskCompletedEntity = TaskCompletedEntity.fromJson(json);

      expect(taskCompletedEntity.completedAt, null);
      expect(taskCompletedEntity.content, null);
      expect(taskCompletedEntity.projectId, null);
      expect(taskCompletedEntity.sectionId, null);
      expect(taskCompletedEntity.taskId, null);
    });

    test('toJson should return a valid JSON map', () {
      const taskCompletedEntity = TaskCompletedEntity(
        completedAt: '2024-08-25T12:34:56Z',
        content: 'Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      final json = taskCompletedEntity.toJson();

      expect(json['completed_at'], '2024-08-25T12:34:56Z');
      expect(json['content'], 'Task Content');
      expect(json['project_id'], 'project_123');
      expect(json['section_id'], 'section_123');
      expect(json['task_id'], 'task_123');
    });

    test('toModel should convert TaskCompletedEntity to TaskCompleted', () {
      const taskCompletedEntity = TaskCompletedEntity(
        completedAt: '2024-08-25T12:34:56Z',
        content: 'Task Content',
        projectId: 'project_123',
        sectionId: 'section_123',
        taskId: 'task_123',
      );

      final taskCompleted = taskCompletedEntity.toModel();

      expect(
        taskCompleted.completedAt,
        DateTime.parse('2024-08-25T12:34:56Z').toLocal(),
      );
      expect(taskCompleted.content, 'Task Content');
      expect(taskCompleted.projectId, 'project_123');
      expect(taskCompleted.sectionId, 'section_123');
      expect(taskCompleted.taskId, 'task_123');
    });
  });
}
