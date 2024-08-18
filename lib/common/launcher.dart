import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/app/view/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locale/locale.dart';

Future<void> launcher(Callback<FutureOr<void>> config) async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: await CacheStorage.initialize();
  // TODO: CachedBloc.initialize();

  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission();
  await firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  final deviceToken = await firebaseMessaging.getTokenOrEmpty();

  await preloadImage(AssetImages.logo());
  await config();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = AppBlocObserver();

  runApp(App(deviceToken: deviceToken));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (Environment.current.isDev) {
      bloc.$debugPrint(change.runtimeType, tag: 'bloc.change');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    bloc.$debugPrint('($error, $stackTrace)', tag: 'bloc.error');
    super.onError(bloc, error, stackTrace);
  }
}

extension on FirebaseMessaging {
  Future<String> getTokenOrEmpty() async {
    try {
      await getAPNSToken();
      return (await getToken()) ?? '';
    } catch (e) {
      $debugPrint(e, tag: 'getToken');
      return '';
    }
  }
}
