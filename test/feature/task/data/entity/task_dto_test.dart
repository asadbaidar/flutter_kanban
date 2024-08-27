import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskDtoEntity', () {
    test('fromJson should return a valid TaskDtoEntity', () {
      const json = {
        'content': 'Task Content',
        'description': 'Task Description',
        'section_id': 'section_123',
        'labels': ['label1', 'label2'],
        'priority': 5,
        'due_string': '2024-08-25',
        'due_date': '2024-08-25',
        'due_datetime': '2024-08-25T12:34:56Z',
        'assignee_id': 'user_123',
        'duration': 60,
        'duration_unit': 'minute',
      };

      final taskDtoEntity = TaskDtoEntity.fromJson(json);

      expect(taskDtoEntity.content, 'Task Content');
      expect(taskDtoEntity.description, 'Task Description');
      expect(taskDtoEntity.sectionId, 'section_123');
      expect(taskDtoEntity.labels, ['label1', 'label2']);
      expect(taskDtoEntity.priority, 5);
      expect(taskDtoEntity.dueString, '2024-08-25');
      expect(taskDtoEntity.dueDate, '2024-08-25');
      expect(taskDtoEntity.dueDatetime, '2024-08-25T12:34:56Z');
      expect(taskDtoEntity.assigneeId, 'user_123');
      expect(taskDtoEntity.duration, 60);
      expect(taskDtoEntity.durationUnit, 'minute');
    });

    test('fromJson with null values should handle gracefully', () {
      const json = {
        'content': null,
        'description': null,
        'section_id': null,
        'labels': null,
        'priority': null,
        'due_string': null,
        'due_date': null,
        'due_datetime': null,
        'assignee_id': null,
        'duration': null,
        'duration_unit': null,
      };

      final taskDtoEntity = TaskDtoEntity.fromJson(json);

      expect(taskDtoEntity.content, null);
      expect(taskDtoEntity.description, null);
      expect(taskDtoEntity.sectionId, null);
      expect(taskDtoEntity.labels, null);
      expect(taskDtoEntity.priority, null);
      expect(taskDtoEntity.dueString, null);
      expect(taskDtoEntity.dueDate, null);
      expect(taskDtoEntity.dueDatetime, null);
      expect(taskDtoEntity.assigneeId, null);
      expect(taskDtoEntity.duration, null);
      expect(taskDtoEntity.durationUnit, null);
    });

    test('fromJson with missing fields should handle gracefully', () {
      final Map<String, dynamic> json = {};

      final taskDtoEntity = TaskDtoEntity.fromJson(json);

      expect(taskDtoEntity.content, null);
      expect(taskDtoEntity.description, null);
      expect(taskDtoEntity.sectionId, null);
      expect(taskDtoEntity.labels, null);
      expect(taskDtoEntity.priority, null);
      expect(taskDtoEntity.dueString, null);
      expect(taskDtoEntity.dueDate, null);
      expect(taskDtoEntity.dueDatetime, null);
      expect(taskDtoEntity.assigneeId, null);
      expect(taskDtoEntity.duration, null);
      expect(taskDtoEntity.durationUnit, null);
    });

    test('toJson should return a valid JSON map', () {
      const taskDtoEntity = TaskDtoEntity(
        content: 'Task Content',
        description: 'Task Description',
        sectionId: 'section_123',
        labels: ['label1', 'label2'],
        priority: 5,
        dueString: '2024-08-25',
        dueDate: '2024-08-25',
        dueDatetime: '2024-08-25T12:34:56Z',
        assigneeId: 'user_123',
        duration: 60,
        durationUnit: 'minute',
      );

      final json = taskDtoEntity.toJson();

      expect(json['content'], 'Task Content');
      expect(json['description'], 'Task Description');
      expect(json['section_id'], 'section_123');
      expect(json['labels'], ['label1', 'label2']);
      expect(json['priority'], 5);
      expect(json['due_string'], '2024-08-25');
      expect(json['due_date'], '2024-08-25');
      expect(json['due_datetime'], '2024-08-25T12:34:56Z');
      expect(json['assignee_id'], 'user_123');
      expect(json['duration'], 60);
      expect(json['duration_unit'], 'minute');
    });

    test('fromModel should convert TaskDto to TaskDtoEntity', () {
      final taskDto = TaskDto(
        content: 'Task Content',
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

      final taskDtoEntity = TaskDtoEntity.fromModel(taskDto);

      expect(taskDtoEntity.content, 'Task Content');
      expect(taskDtoEntity.description, 'Task Description');
      expect(taskDtoEntity.sectionId, 'section_123');
      expect(taskDtoEntity.labels, ['label1', 'label2']);
      expect(taskDtoEntity.priority, 5);
      expect(taskDtoEntity.dueString, '2024-08-25');
      expect(taskDtoEntity.dueDate, '2024-08-25');
      expect(taskDtoEntity.dueDatetime, '2024-08-25T12:34:56.000Z');
      expect(taskDtoEntity.assigneeId, 'user_123');
      expect(taskDtoEntity.duration, 60);
      expect(taskDtoEntity.durationUnit, 'minute');
    });
  });
}
