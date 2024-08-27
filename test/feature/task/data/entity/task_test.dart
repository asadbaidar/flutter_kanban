import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskDataEntity', () {
    test('fromJson should return a valid TaskDataEntity', () {
      const json = [
        {
          'creator_id': 'creator_123',
          'created_at': '2024-08-25T12:34:56Z',
          'assignee_id': 'assignee_123',
          'assigner_id': 'assigner_123',
          'comment_count': 5,
          'is_completed': true,
          'content': 'Task Content',
          'description': 'Task Description',
          'due': {
            'date': '2024-08-25',
            'is_recurring': false,
            'datetime': '2024-08-25T12:34:56Z',
            'string': 'due_string',
            'timezone': 'UTC',
          },
          'duration': {
            'amount': 60,
            'unit': 'minute',
          },
          'id': 'task_123',
          'labels': ['label1', 'label2'],
          'order': 1,
          'priority': 5,
          'project_id': 'project_123',
          'section_id': 'section_123',
          'parent_id': 'parent_123',
          'url': 'https://example.com/task_123',
        }
      ];

      final taskDataEntity = TaskDataEntity.fromJson(json);

      expect(taskDataEntity.all?.length, 1);
      final task = taskDataEntity.all?.first;
      expect(task?.creatorId, 'creator_123');
      expect(task?.createdAt, '2024-08-25T12:34:56Z');
      expect(task?.assigneeId, 'assignee_123');
      expect(task?.assignerId, 'assigner_123');
      expect(task?.commentCount, 5);
      expect(task?.isCompleted, true);
      expect(task?.content, 'Task Content');
      expect(task?.description, 'Task Description');
      expect(task?.due?.date, '2024-08-25');
      expect(task?.due?.isRecurring, false);
      expect(task?.due?.datetime, '2024-08-25T12:34:56Z');
      expect(task?.due?.string, 'due_string');
      expect(task?.due?.timezone, 'UTC');
      expect(task?.duration?.amount, 60);
      expect(task?.duration?.unit, 'minute');
      expect(task?.id, 'task_123');
      expect(task?.labels, ['label1', 'label2']);
      expect(task?.order, 1);
      expect(task?.priority, 5);
      expect(task?.projectId, 'project_123');
      expect(task?.sectionId, 'section_123');
      expect(task?.parentId, 'parent_123');
      expect(task?.url, 'https://example.com/task_123');
    });

    test('toJson should return a valid JSON map', () {
      const taskEntity = TaskEntity(
        creatorId: 'creator_123',
        createdAt: '2024-08-25T12:34:56Z',
        assigneeId: 'assignee_123',
        assignerId: 'assigner_123',
        commentCount: 5,
        isCompleted: true,
        content: 'Task Content',
        description: 'Task Description',
        due: TaskDueEntity(
          date: '2024-08-25',
          isRecurring: false,
          datetime: '2024-08-25T12:34:56Z',
          string: 'due_string',
          timezone: 'UTC',
        ),
        duration: TaskDurationEntity(
          amount: 60,
          unit: 'minute',
        ),
        id: 'task_123',
        labels: ['label1', 'label2'],
        order: 1,
        priority: 5,
        projectId: 'project_123',
        sectionId: 'section_123',
        parentId: 'parent_123',
        url: 'https://example.com/task_123',
      );

      final json = taskEntity.toJson();

      expect(json['creator_id'], 'creator_123');
      expect(json['created_at'], '2024-08-25T12:34:56Z');
      expect(json['assignee_id'], 'assignee_123');
      expect(json['assigner_id'], 'assigner_123');
      expect(json['comment_count'], 5);
      expect(json['is_completed'], true);
      expect(json['content'], 'Task Content');
      expect(json['description'], 'Task Description');
      expect(json['due'], isA<TaskDueEntity>());
      expect(json['duration'], isA<TaskDurationEntity>());
      expect(json['id'], 'task_123');
      expect(json['labels'], ['label1', 'label2']);
      expect(json['order'], 1);
      expect(json['priority'], 5);
      expect(json['project_id'], 'project_123');
      expect(json['section_id'], 'section_123');
      expect(json['parent_id'], 'parent_123');
      expect(json['url'], 'https://example.com/task_123');
    });

    test('toModel should convert TaskDataEntity to TaskData', () {
      const taskEntity = TaskEntity(
        creatorId: 'creator_123',
        createdAt: '2024-08-25T12:34:56Z',
        assigneeId: 'assignee_123',
        assignerId: 'assigner_123',
        commentCount: 5,
        isCompleted: true,
        content: 'Task Content',
        description: 'Task Description',
        due: TaskDueEntity(
          date: '2024-08-25',
          isRecurring: false,
          datetime: '2024-08-25T12:34:56Z',
          string: 'due_string',
          timezone: 'UTC',
        ),
        duration: TaskDurationEntity(
          amount: 60,
          unit: 'minute',
        ),
        id: 'task_123',
        labels: ['label1', 'label2'],
        order: 1,
        priority: 5,
        projectId: 'project_123',
        sectionId: 'section_123',
        parentId: 'parent_123',
        url: 'https://example.com/task_123',
      );

      const taskDataEntity = TaskDataEntity(all: [taskEntity]);
      final taskData = taskDataEntity.toModel();

      expect(taskData.all?['section_123']?.length, 1);
      final task = taskData.all?['section_123']?.first;
      expect(task?.creatorId, 'creator_123');
      expect(task?.createdAt, '2024-08-25T12:34:56Z');
      expect(task?.assigneeId, 'assignee_123');
      expect(task?.assignerId, 'assigner_123');
      expect(task?.commentCount, 5);
      expect(task?.isCompleted, true);
      expect(task?.content, 'Task Content');
      expect(task?.description, 'Task Description');
      expect(task?.due?.date, '2024-08-25');
      expect(task?.due?.isRecurring, false);
      expect(
        task?.due?.datetime,
        DateTime.parse('2024-08-25T12:34:56Z').toLocal(),
      );
      expect(task?.due?.string, 'due_string');
      expect(task?.due?.timezone, 'UTC');
      expect(task?.duration?.amount, 60);
      expect(task?.duration?.unit, DurationUnit.minute);
      expect(task?.id, 'task_123');
      expect(task?.labels, ['label1', 'label2']);
      expect(task?.order, 1);
      expect(task?.priority, 5);
      expect(task?.projectId, 'project_123');
      expect(task?.sectionId, 'section_123');
      expect(task?.parentId, 'parent_123');
      expect(task?.url, 'https://example.com/task_123');
    });
  });

  group('TaskEntity', () {
    test('fromJson should return a valid TaskEntity', () {
      const json = {
        'creator_id': 'creator_123',
        'created_at': '2024-08-25T12:34:56Z',
        'assignee_id': 'assignee_123',
        'assigner_id': 'assigner_123',
        'comment_count': 5,
        'is_completed': true,
        'content': 'Task Content',
        'description': 'Task Description',
        'due': {
          'date': '2024-08-25',
          'is_recurring': false,
          'datetime': '2024-08-25T12:34:56Z',
          'string': 'due_string',
          'timezone': 'UTC',
        },
        'duration': {
          'amount': 60,
          'unit': 'minute',
        },
        'id': 'task_123',
        'labels': ['label1', 'label2'],
        'order': 1,
        'priority': 5,
        'project_id': 'project_123',
        'section_id': 'section_123',
        'parent_id': 'parent_123',
        'url': 'https://example.com/task_123',
      };

      final taskEntity = TaskEntity.fromJson(json);

      expect(taskEntity.creatorId, 'creator_123');
      expect(taskEntity.createdAt, '2024-08-25T12:34:56Z');
      expect(taskEntity.assigneeId, 'assignee_123');
      expect(taskEntity.assignerId, 'assigner_123');
      expect(taskEntity.commentCount, 5);
      expect(taskEntity.isCompleted, true);
      expect(taskEntity.content, 'Task Content');
      expect(taskEntity.description, 'Task Description');
      expect(taskEntity.due?.date, '2024-08-25');
      expect(taskEntity.due?.isRecurring, false);
      expect(taskEntity.due?.datetime, '2024-08-25T12:34:56Z');
      expect(taskEntity.due?.string, 'due_string');
      expect(taskEntity.due?.timezone, 'UTC');
      expect(taskEntity.duration?.amount, 60);
      expect(taskEntity.duration?.unit, 'minute');
      expect(taskEntity.id, 'task_123');
      expect(taskEntity.labels, ['label1', 'label2']);
      expect(taskEntity.order, 1);
      expect(taskEntity.priority, 5);
      expect(taskEntity.projectId, 'project_123');
      expect(taskEntity.sectionId, 'section_123');
      expect(taskEntity.parentId, 'parent_123');
      expect(taskEntity.url, 'https://example.com/task_123');
    });

    test('toJson should return a valid JSON map', () {
      const taskEntity = TaskEntity(
        creatorId: 'creator_123',
        createdAt: '2024-08-25T12:34:56Z',
        assigneeId: 'assignee_123',
        assignerId: 'assigner_123',
        commentCount: 5,
        isCompleted: true,
        content: 'Task Content',
        description: 'Task Description',
        due: TaskDueEntity(
          date: '2024-08-25',
          isRecurring: false,
          datetime: '2024-08-25T12:34:56Z',
          string: 'due_string',
          timezone: 'UTC',
        ),
        duration: TaskDurationEntity(
          amount: 60,
          unit: 'minute',
        ),
        id: 'task_123',
        labels: ['label1', 'label2'],
        order: 1,
        priority: 5,
        projectId: 'project_123',
        sectionId: 'section_123',
        parentId: 'parent_123',
        url: 'https://example.com/task_123',
      );

      final json = taskEntity.toJson();

      expect(json['creator_id'], 'creator_123');
      expect(json['created_at'], '2024-08-25T12:34:56Z');
      expect(json['assignee_id'], 'assignee_123');
      expect(json['assigner_id'], 'assigner_123');
      expect(json['comment_count'], 5);
      expect(json['is_completed'], true);
      expect(json['content'], 'Task Content');
      expect(json['description'], 'Task Description');
      expect(json['due'], isA<TaskDueEntity>());
      expect(json['duration'], isA<TaskDurationEntity>());
      expect(json['id'], 'task_123');
      expect(json['labels'], ['label1', 'label2']);
      expect(json['order'], 1);
      expect(json['priority'], 5);
      expect(json['project_id'], 'project_123');
      expect(json['section_id'], 'section_123');
      expect(json['parent_id'], 'parent_123');
      expect(json['url'], 'https://example.com/task_123');
    });

    test('toModel should convert TaskEntity to Task', () {
      const taskEntity = TaskEntity(
        creatorId: 'creator_123',
        createdAt: '2024-08-25T12:34:56Z',
        assigneeId: 'assignee_123',
        assignerId: 'assigner_123',
        commentCount: 5,
        isCompleted: true,
        content: 'Task Content',
        description: 'Task Description',
        due: TaskDueEntity(
          date: '2024-08-25',
          isRecurring: false,
          datetime: '2024-08-25T12:34:56Z',
          string: 'due_string',
          timezone: 'UTC',
        ),
        duration: TaskDurationEntity(
          amount: 60,
          unit: 'minute',
        ),
        id: 'task_123',
        labels: ['label1', 'label2'],
        order: 1,
        priority: 5,
        projectId: 'project_123',
        sectionId: 'section_123',
        parentId: 'parent_123',
        url: 'https://example.com/task_123',
      );

      final task = taskEntity.toModel();

      expect(task.creatorId, 'creator_123');
      expect(task.createdAt, '2024-08-25T12:34:56Z');
      expect(task.assigneeId, 'assignee_123');
      expect(task.assignerId, 'assigner_123');
      expect(task.commentCount, 5);
      expect(task.isCompleted, true);
      expect(task.content, 'Task Content');
      expect(task.description, 'Task Description');
      expect(task.due?.date, '2024-08-25');
      expect(task.due?.isRecurring, false);
      expect(
        task.due?.datetime,
        DateTime.parse('2024-08-25T12:34:56Z').toLocal(),
      );
      expect(task.due?.string, 'due_string');
      expect(task.due?.timezone, 'UTC');
      expect(task.duration?.amount, 60);
      expect(task.duration?.unit, DurationUnit.minute);
      expect(task.id, 'task_123');
      expect(task.labels, ['label1', 'label2']);
      expect(task.order, 1);
      expect(task.priority, 5);
      expect(task.projectId, 'project_123');
      expect(task.sectionId, 'section_123');
      expect(task.parentId, 'parent_123');
      expect(task.url, 'https://example.com/task_123');
    });
  });

  group('TaskDueEntity', () {
    test('fromJson should return a valid TaskDueEntity', () {
      const json = {
        'date': '2024-08-25',
        'is_recurring': false,
        'datetime': '2024-08-25T12:34:56Z',
        'string': 'due_string',
        'timezone': 'UTC',
      };

      final taskDueEntity = TaskDueEntity.fromJson(json);

      expect(taskDueEntity.date, '2024-08-25');
      expect(taskDueEntity.isRecurring, false);
      expect(taskDueEntity.datetime, '2024-08-25T12:34:56Z');
      expect(taskDueEntity.string, 'due_string');
      expect(taskDueEntity.timezone, 'UTC');
    });

    test('toJson should return a valid JSON map', () {
      const taskDueEntity = TaskDueEntity(
        date: '2024-08-25',
        isRecurring: false,
        datetime: '2024-08-25T12:34:56Z',
        string: 'due_string',
        timezone: 'UTC',
      );

      final json = taskDueEntity.toJson();

      expect(json['date'], '2024-08-25');
      expect(json['is_recurring'], false);
      expect(json['datetime'], '2024-08-25T12:34:56Z');
      expect(json['string'], 'due_string');
      expect(json['timezone'], 'UTC');
    });

    test('toModel should convert TaskDueEntity to TaskDue', () {
      const taskDueEntity = TaskDueEntity(
        date: '2024-08-25',
        isRecurring: false,
        datetime: '2024-08-25T12:34:56Z',
        string: 'due_string',
        timezone: 'UTC',
      );

      final taskDue = taskDueEntity.toModel();

      expect(taskDue.date, '2024-08-25');
      expect(taskDue.isRecurring, false);
      expect(
        taskDue.datetime,
        DateTime.parse('2024-08-25T12:34:56Z').toLocal(),
      );
      expect(taskDue.string, 'due_string');
      expect(taskDue.timezone, 'UTC');
    });
  });

  group('TaskDurationEntity', () {
    test('fromJson should return a valid TaskDurationEntity', () {
      const json = {
        'amount': 60,
        'unit': 'minute',
      };

      final taskDurationEntity = TaskDurationEntity.fromJson(json);

      expect(taskDurationEntity.amount, 60);
      expect(taskDurationEntity.unit, 'minute');
    });

    test('toJson should return a valid JSON map', () {
      const taskDurationEntity = TaskDurationEntity(
        amount: 60,
        unit: 'minute',
      );

      final json = taskDurationEntity.toJson();

      expect(json['amount'], 60);
      expect(json['unit'], 'minute');
    });

    test('toModel should convert TaskDurationEntity to TaskDuration', () {
      const taskDurationEntity = TaskDurationEntity(
        amount: 60,
        unit: 'minute',
      );

      final taskDuration = taskDurationEntity.toModel();

      expect(taskDuration.amount, 60);
      expect(taskDuration.unit, DurationUnit.minute);
    });
  });
}
