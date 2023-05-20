import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

export '../theme/app_colors.dart';
export '../theme/app_text_styles.dart';
export '../theme/theme.dart';
export '../firebase/analytics.dart';
export '../../services/get_it.dart';
export '../../services/local_storage/shared_pref.dart';
export '../../routes/router.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String arabicFont = "scheherazaderegular";

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

enum TranslatedName {
  en,
  kz,
  ru,
  tr,
}
