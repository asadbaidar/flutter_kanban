# Kanban

Flutter app for Kanban board to manage tasks using Todoist API.

## Getting Started
Make sure you have following flutter/dart sdk installed on your machine. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).

**flutter: 2.24.0**
**dart: 3.5.0**

To run the app, use the following commands:
```sh
$ flutter pub get
$ dart run build_runner build --delete-conflicting-outputs
$ flutter run --flavor dev --target app/kanban/lib/main_dev.dart
```

To generate the binaries, use the following commands:
```sh
$ flutter build apk --flavor dev --target app/kanban/lib/main_dev.dart
$ flutter build appbundle --flavor dev --target app/kanban/lib/main_dev.dart
$ flutter build ipa --flavor dev --target app/kanban/lib/main_dev.dart
```


## Local Test Coverage
Run test coverage and generate report. lcov is required to generate the report. Install it before running the command.
```sh
$ sh test_coverage.sh
```