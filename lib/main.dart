import 'dart:async';
import 'package:allah_names/firebase_options.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/screens/app/app.dart';
import 'package:allah_names/src/services/provider/locale_provider.dart';
import 'package:background_location/background_location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var logger = Logger();

  logger.v("Verbose log");
  logger.d("Debug log");
  logger.i("Info log");
  logger.w("Warning log");
  logger.e("Error log");
  logger.wtf("What a terrible failure log");

  await initGetIt();
  await sharedPreference.initSharedPreferences();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  sharedPreference.setDarkMode(false);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleNotifier()),
        // ChangeNotifierProvider(create: (context) => HomeProvider()),
        // ChangeNotifierProvider(create: (context) => CreateDocumentProvider()),
      ],
      child: const AllahApp(),
    ),
  );
}
