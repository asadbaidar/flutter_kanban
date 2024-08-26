import 'package:bloc_test/bloc_test.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectRepository extends Mock implements ProjectRepository {}

class MockProject extends Mock implements Project {}

void main() {
  late ProjectBloc projectBloc;
  late MockProjectRepository mockProjectRepository;

  final mockProject = MockProject();
  final mockProjectsList = [mockProject];

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    projectBloc = ProjectBloc(projectRepository: mockProjectRepository);
  });

  group('ProjectBloc', () {
    blocTest<ProjectBloc, ProjectState>(
      'emits [loading, loaded] when getProjects succeeds',
      setUp: () {
        when(() => mockProjectRepository.getProjects())
            .thenAnswer((_) async => mockProjectsList);
      },
      build: () => projectBloc,
      act: (bloc) => bloc.getProjects(),
      expect: () => [
        const ProjectState(
          dataState: ProjectDataState.loading(),
        ),
        ProjectState(
          dataState: ProjectDataState.loaded(
            value: mockProjectsList,
          ),
        ),
      ],
      verify: (_) {
        verify(() => mockProjectRepository.getProjects()).called(1);
      },
    );

    blocTest<ProjectBloc, ProjectState>(
      'emits [loading, failure] when getProjects fails',
      setUp: () {
        when(() => mockProjectRepository.getProjects()).thenThrow(
          'Failed to fetch projects',
        );
      },
      build: () => projectBloc,
      act: (bloc) => bloc.getProjects(),
      expect: () => [
        const ProjectState(
          dataState: ProjectDataState.loading(),
        ),
        const ProjectState(
          dataState: ProjectDataState.failure(
            error: 'Failed to fetch projects',
          ),
        ),
      ],
      verify: (_) {
        verify(() => mockProjectRepository.getProjects()).called(1);
      },
    );

    blocTest<ProjectBloc, ProjectState>(
      'emits state with selected project when selectProject is called',
      build: () => projectBloc,
      act: (bloc) => bloc.selectProject(mockProject),
      expect: () => [
        ProjectState(
          selectedProject: mockProject,
        ),
      ],
    );

    blocTest<ProjectBloc, ProjectState>(
      'does not emit new state when selectProject is called with null',
      build: () => projectBloc,
      act: (bloc) => bloc.selectProject(null),
      expect: () => <ProjectState>[],
    );
  });
}
