# Kanban

Flutter app for Kanban board to manage tasks using Todoist API.

## Features
- [x] View all projects and select one to view tasks
- [x] View all tasks and their details
- [x] Add a new task or edit one
- [x] Move task between sections by dragging or with dropdown
- [x] Add or view comments on task
- [x] Complete a task
- [x] View completed task history
- [x] Reopen the completed task

## Screenshots
| Home | Board | Task |
| --- | --- | --- |
| ![home](.content/home.png) | ![Board](.content/board.png) | ![Task](.content/task.png) |

## Screen records
| Create | Edit | Comment | Complete |
| --- | --- | --- | --- |
| <video src="https://github.com/user-attachments/assets/9c69e23d-0594-49a7-a5bf-24a74bb6264d" controls> | <video src="https://github.com/user-attachments/assets/204a2f4c-71c4-4b69-9cc6-d9f77a08d47e" controls> | <video src="https://github.com/user-attachments/assets/6822a310-6d40-40e7-8be4-eba0eea2f28f" controls> | <video src="https://github.com/user-attachments/assets/82b1509e-6153-4dbb-a14a-df9aca9dd688" controls> | 

## Pre-requisites
Make sure you have following or latest flutter/dart sdk installed on your machine. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).

`flutter: 2.24.0`
`dart: 3.5.0`

## Setup
1. Add your Todoist API token in `app/kanban/lib/environment.dart` file.

```dart
  static const apiToken = 'TODOIST_API_TOKEN';
```

2. To setup the project, use the following commands:
```sh
$ flutter pub get
$ dart run build_runner build --delete-conflicting-outputs
```

3. To run the app, use the following commands:
```sh
$ cd app/kanban
$ flutter run --flavor dev --target lib/main_dev.dart
```

4. To generate the binaries, use the following commands:
```sh
$ cd app/kanban
$ flutter build apk --flavor dev --target lib/main_dev.dart
$ flutter build appbundle --flavor dev --target lib/main_dev.dart
$ flutter build ipa --flavor dev --target lib/main_dev.dart
```

## Local Test Coverage
To run test coverage and generate report, lcov is required. Install it before running the command.
```sh
$ sh test_coverage.sh
```
