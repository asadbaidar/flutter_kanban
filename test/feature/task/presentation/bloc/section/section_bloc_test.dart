import 'package:bloc_test/bloc_test.dart';
import 'package:core/feature/project/project.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSectionRepository extends Mock implements SectionRepository {}

void main() {
  late SectionBloc sectionBloc;
  late MockSectionRepository mockSectionRepository;

  setUp(() {
    mockSectionRepository = MockSectionRepository();
    sectionBloc = SectionBloc(sectionRepository: mockSectionRepository);
  });

  group('SectionBloc', () {
    blocTest<SectionBloc, SectionState>(
      'emits loading and then new state with sections when getSections is successful',
      build: () {
        when(() => mockSectionRepository.getSections(any())).thenAnswer(
          (_) async => [const Section(id: '1')],
        );
        return sectionBloc;
      },
      act: (bloc) => bloc.getSections(),
      expect: () => [
        const SectionState(dataState: SectionDataState.loading()),
        const SectionState(
          dataState: SectionDataState.loaded(value: [Section(id: '1')]),
        ),
      ],
    );

    blocTest<SectionBloc, SectionState>(
      'emits loading and then failure when getSections throws an error',
      build: () {
        when(() => mockSectionRepository.getSections(any()))
            .thenThrow('Failed to load sections');
        return sectionBloc;
      },
      act: (bloc) => bloc.getSections(),
      expect: () => [
        const SectionState(dataState: SectionDataState.loading()),
        const SectionState(
          dataState: SectionDataState.failure(
            error: 'Failed to load sections',
          ),
        ),
      ],
    );

    blocTest<SectionBloc, SectionState>(
      'does not call getSections if project is not changed',
      build: () {
        when(() => mockSectionRepository.getSections(any())).thenAnswer(
          (_) async => [const Section(id: '1')],
        );
        return sectionBloc;
      },
      act: (bloc) {
        bloc.projectChanged(null); // No project change
        bloc.projectChanged(const Project(id: 'project1'));
        bloc.projectChanged(const Project(id: 'project1')); // No change
      },
      verify: (_) {
        verify(() => mockSectionRepository.getSections(any())).called(1);
      },
    );

    blocTest<SectionBloc, SectionState>(
      'calls getSections when project is changed',
      build: () {
        when(() => mockSectionRepository.getSections(any())).thenAnswer(
          (_) async => [const Section(id: '1')],
        );
        return sectionBloc;
      },
      act: (bloc) {
        bloc.projectChanged(const Project(id: 'project1')); // Project change
      },
      verify: (_) {
        verify(() => mockSectionRepository.getSections('project1')).called(1);
      },
    );

    test('initial state is SectionState()', () {
      expect(sectionBloc.state, const SectionState());
    });

    test('projectChanged updates state correctly', () {
      const project = Project(id: 'project1');
      sectionBloc.projectChanged(project);
      expect(sectionBloc.state.project, project);
    });
  });
}
