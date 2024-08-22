import 'package:common/common.dart';

class SyncCommand {
  SyncCommand({
    required this.type,
    required this.args,
  });

  final String type;
  final JsonObject args;

  Map<String, dynamic> toJson() => {
        'type': type,
        'uuid': uuid.v4(),
        'args': args,
      };

  HttpFormData toFormData() => HttpFormData.fromMap({
        'commands': [toJson()].toJsonString(),
      });
}
