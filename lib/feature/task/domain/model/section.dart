import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';

@freezed
class Section with _$Section {
  const factory Section({
    String? id,
    String? projectId,
    int? order,
    String? name,
  }) = _Section;
}
