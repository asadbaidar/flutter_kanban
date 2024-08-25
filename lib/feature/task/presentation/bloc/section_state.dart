import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_state.freezed.dart';

typedef SectionDataState = Data<List<Section>>;

@freezed
class SectionState with _$SectionState {
  const factory SectionState({
    @Default(SectionDataState()) SectionDataState sectionDataState,
    Project? project,
  }) = _SectionState;
}

extension SectionStateValues on SectionState {
  String get projectId => project?.id ?? '';

  List<Section> get sections => sectionDataState.value ?? [];
}

extension GetSectionById on List<Section> {
  Section? getById(String? id) =>
      firstWhereOrNull((element) => element.id == id);
}
