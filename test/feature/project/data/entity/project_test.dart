import 'package:core/feature/project/data/entity/project.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProjectEntity', () {
    test('fromJson creates a valid ProjectEntity', () {
      const json = {
        'id': '123',
        'name': 'Test Project',
        'comment_count': 5,
        'order': 1,
        'color': 'red',
        'is_shared': true,
        'is_favorite': false,
        'is_inbox_project': true,
        'is_team_inbox': false,
        'view_style': 'list',
        'url': 'https://example.com',
        'parent_id': 'parent123',
      };

      final entity = ProjectEntity.fromJson(json);

      expect(entity.id, json['id']);
      expect(entity.name, json['name']);
      expect(entity.commentCount, json['comment_count']);
      expect(entity.order, json['order']);
      expect(entity.color, json['color']);
      expect(entity.isShared, json['is_shared']);
      expect(entity.isFavorite, json['is_favorite']);
      expect(entity.isInboxProject, json['is_inbox_project']);
      expect(entity.isTeamInbox, json['is_team_inbox']);
      expect(entity.viewStyle, json['view_style']);
      expect(entity.url, json['url']);
      expect(entity.parentId, json['parent_id']);
    });

    test('toJson converts ProjectEntity to a valid JSON map', () {
      final entity = ProjectEntity(
        id: '123',
        name: 'Test Project',
        commentCount: 5,
        order: 1,
        color: 'red',
        isShared: true,
        isFavorite: false,
        isInboxProject: true,
        isTeamInbox: false,
        viewStyle: 'list',
        url: 'https://example.com',
        parentId: 'parent123',
      );

      final json = entity.toJson();

      expect(json['id'], entity.id);
      expect(json['name'], entity.name);
      expect(json['comment_count'], entity.commentCount);
      expect(json['order'], entity.order);
      expect(json['color'], entity.color);
      expect(json['is_shared'], entity.isShared);
      expect(json['is_favorite'], entity.isFavorite);
      expect(json['is_inbox_project'], entity.isInboxProject);
      expect(json['is_team_inbox'], entity.isTeamInbox);
      expect(json['view_style'], entity.viewStyle);
      expect(json['url'], entity.url);
      expect(json['parent_id'], entity.parentId);
    });

    test('toModel converts ProjectEntity to Project model', () {
      final entity = ProjectEntity(
        id: '123',
        name: 'Test Project',
        commentCount: 5,
        order: 1,
        color: 'red',
        isShared: true,
        isFavorite: false,
        isInboxProject: true,
        isTeamInbox: false,
        viewStyle: 'list',
        url: 'https://example.com',
        parentId: 'parent123',
      );

      final model = entity.toModel();

      expect(model.id, entity.id);
      expect(model.name, entity.name);
      expect(model.commentCount, entity.commentCount);
      expect(model.order, entity.order);
      expect(model.color, entity.color);
      expect(model.isShared, entity.isShared);
      expect(model.isFavorite, entity.isFavorite);
      expect(model.isInboxProject, entity.isInboxProject);
      expect(model.isTeamInbox, entity.isTeamInbox);
      expect(model.viewStyle, entity.viewStyle);
      expect(model.url, entity.url);
      expect(model.parentId, entity.parentId);
    });
  });
}
