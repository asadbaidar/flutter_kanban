import 'package:app/environment.dart';
import 'package:core/core.dart';

Future<void> main() async => launcher(() {
      Environment.current = AppEnvironment.qa;
    });
