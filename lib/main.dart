import 'dart:async';
import 'package:allah_names/firebase_options.dart';
import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/features/app/app.dart';
import 'package:allah_names/src/services/provider/app_provider.dart';
import 'package:allah_names/src/services/provider/locale_provider.dart';
import 'package:allah_names/src/services/provider/theme_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Talker talker = TalkerFlutter.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await sharedPreference.initSharedPreferences();
    await initTalker(talker: talker);

    sharedPreference.setDarkMode(false);
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleNotifier()),
          ChangeNotifierProvider(create: (context) => ThemeProviderNotifier()),
          ChangeNotifierProvider(create: (context) => AppNotifier()),
        ],
        child: DevicePreview(
          enabled: false, // !kReleaseMode
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
