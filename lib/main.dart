import 'dart:async';
import 'package:allah_names/firebase_options.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/features/app/app.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';
import 'package:allah_names/src/services/provider/locale_provider.dart';
import 'package:allah_names/src/services/provider/theme_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Talker talker = TalkerFlutter.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sharedPreference.initSharedPreferences();
  await initTalker(talker: talker);

  sharedPreference.setDarkMode(false);
  runZonedGuarded(() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleNotifier()),
          ChangeNotifierProvider(create: (context) => ThemeProviderNotifier()),
          ChangeNotifierProvider(create: (context) => AppNotifier()),
        ],
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (BuildContext context) {
            return const AllahApp();
          },
        ),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  });
}

Future<void> initTalker({required Talker talker}) async {
  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I<Talker>().debug("99 names app started");

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printEventFullData: false,
        printStateFullData: false,
      ));

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    GetIt.I<Talker>().handle(error, stack);
    return true;
  };

  FlutterError.onError = (details) => {
        FirebaseCrashlytics.instance.recordError(details.exception, details.stack),
        GetIt.I<Talker>().handle(details.exception, details.stack),
      };
}
