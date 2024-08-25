class TaskEndpoints {
  TaskEndpoints._(); // coverage:ignore-line

  // Rest
  static const tasks = 'tasks';
  static const sections = 'sections';

  static String close(String id) => '$tasks/$id/close';
  static String reopen(String id) => '$tasks/$id/reopen';

  // Sync
  static const completed = 'completed/get_all';
  static const sync = 'sync';
  static const itemMove = 'item_move';
}
