import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskDto', () {
    test('factory should create a TaskDto with given values', () {
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

      expect(taskDto.content, 'Task Content');
      expect(taskDto.description, 'Task Description');
      expect(taskDto.sectionId, 'section_123');
      expect(taskDto.labels, ['label1', 'label2']);
      expect(taskDto.priority, 5);
      expect(taskDto.dueString, '2024-08-25');
      expect(taskDto.dueDate, '2024-08-25');
      expect(taskDto.dueDatetime, DateTime.parse('2024-08-25T12:34:56Z'));
      expect(taskDto.assigneeId, 'user_123');
      expect(taskDto.duration, '60');
      expect(taskDto.durationUnit, DurationUnit.minute);
    });
  });
}
