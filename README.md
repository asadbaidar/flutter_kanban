# core

core mobile app package.

## Development
```sh
$ flutter build apk --flavor dev --target lib/main_dev.dart
$ flutter build appbundle --flavor dev --target lib/main_dev.dart
$ flutter build ipa --flavor dev --target lib/main_dev.dart
```

## QA
```sh
$ flutter build apk --flavor qa --target lib/main_qa.dart
$ flutter build appbundle --flavor qa --target lib/main_qa.dart
$ flutter build ipa --flavor qa --target lib/main_qa.dart
```

## Staging
```sh
$ flutter build apk --flavor stage --target lib/main_stage.dart
$ flutter build appbundle --flavor stage --target lib/main_stage.dart
$ flutter build ipa --flavor stage --target lib/main_stage.dart
```

## Production
```sh
$ flutter build apk --flavor prod --target lib/main_prod.dart
$ flutter build appbundle --flavor prod --target lib/main_prod.dart
$ flutter build ipa --flavor prod --target lib/main_prod.dart
```

## App Store Connect

- First make sure App Store Connect API key is placed in `project_path/private_keys` folder.
- After building IPA, upload it using the following command:

```sh
$ xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey <API_KEY> --apiIssuer <API_ISSUER>
```

## Local Test Coverage
Run test coverage and generate report using the following command:
```sh
$ sh test_coverage.sh
```