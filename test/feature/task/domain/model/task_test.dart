import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskData', () {
    test('copyWith creates a new TaskData with updated values', () {
      const taskData = TaskData(
        all: {
          'section1': [Task(id: 'task1')],
        },
      );

      final updatedTaskData = taskData.copyWith(
        all: {
          'section2': [const Task(id: 'task2')],
        },
      );

      expect(updatedTaskData.all, {
        'section2': [const Task(id: 'task2')],
      });
    });

    test('equality comparison checks equality of two TaskData', () {
      const taskData1 = TaskData(
        all: {
          'section1': [Task(id: 'task1')],
        },
      );

      const taskData2 = TaskData(
        all: {
          'section1': [Task(id: 'task1')],
        },
      );

      const taskData3 = TaskData(
        all: {
          'section2': [Task(id: 'task2')],
        },
      );

      expect(taskData1, taskData2);
      expect(taskData1, isNot(taskData3));
    });
  });

  group('Task', () {
    test('copyWith creates a new Task with updated values', () {
      const task = Task(
        id: 'task1',
        content: 'Sample task',
        isCompleted: false,
      );

      final updatedTask = task.copyWith(
        content: 'Updated task',
        isCompleted: true,
      );

      expect(updatedTask.id, 'task1');
      expect(updatedTask.content, 'Updated task');
      expect(updatedTask.isCompleted, true);
    });

    test('equality comparison checks equality of two Tasks', () {
      const task1 = Task(
        id: 'task1',
        content: 'Sample task',
        isCompleted: false,
      );

      const task2 = Task(
        id: 'task1',
        content: 'Sample task',
        isCompleted: false,
      );

      const task3 = Task(
        id: 'task2',
        content: 'Different task',
        isCompleted: true,
      );

      expect(task1, task2);
      expect(task1, isNot(task3));
    });

    test('hashCode is consistent with equality', () {
      const task1 = Task(
        id: 'task1',
        content: 'Sample task',
        isCompleted: false,
      );

      const task2 = Task(
        id: 'task1',
        content: 'Sample task',
        isCompleted: false,
      );

      expect(task1.hashCode, task2.hashCode);
    });
  });

  group('TaskDue', () {
    test('copyWith creates a new TaskDue with updated values', () {
      const taskDue = TaskDue(
        date: '2024-08-25',
        isRecurring: false,
      );

      final updatedTaskDue = taskDue.copyWith(
        date: '2024-08-26',
        isRecurring: true,
      );

      expect(updatedTaskDue.date, '2024-08-26');
      expect(updatedTaskDue.isRecurring, true);
    });

    test('equality comparison checks equality of two TaskDue', () {
      const taskDue1 = TaskDue(
        date: '2024-08-25',
        isRecurring: false,
      );

      const taskDue2 = TaskDue(
        date: '2024-08-25',
        isRecurring: false,
      );

      const taskDue3 = TaskDue(
        date: '2024-08-26',
        isRecurring: true,
      );

      expect(taskDue1, taskDue2);
      expect(taskDue1, isNot(taskDue3));
    });
  });

  group('TaskDuration', () {
    test('copyWith creates a new TaskDuration with updated values', () {
      const taskDuration = TaskDuration(
        amount: 2,
        unit: DurationUnit.day,
      );

      final updatedTaskDuration = taskDuration.copyWith(
        amount: 3,
        unit: DurationUnit.minute,
      );

      expect(updatedTaskDuration.amount, 3);
      expect(updatedTaskDuration.unit, DurationUnit.minute);
    });

    test('equality comparison checks equality of two TaskDuration', () {
      const taskDuration1 = TaskDuration(
        amount: 2,
        unit: DurationUnit.day,
      );

      const taskDuration2 = TaskDuration(
        amount: 2,
        unit: DurationUnit.day,
      );

      const taskDuration3 = TaskDuration(
        amount: 3,
        unit: DurationUnit.minute,
      );

      expect(taskDuration1, taskDuration2);
      expect(taskDuration1, isNot(taskDuration3));
    });
  });

  group('DurationUnit', () {
    test('fromName returns the correct DurationUnit', () {
      expect(DurationUnit.fromName('minute'), DurationUnit.minute);
      expect(DurationUnit.fromName('day'), DurationUnit.day);
      expect(DurationUnit.fromName(null), isNull);
      expect(DurationUnit.fromName('unknown'), isNull);
    });
  });
}
