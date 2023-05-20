import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/services/provider/locale_provider.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AllahApp extends StatefulWidget {
  const AllahApp({super.key});

  @override
  State<AllahApp> createState() => _AllahAppState();
}

final appRouter = AppRouter();

class _AllahAppState extends State<AllahApp> {
  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleNotifier>(context).getLocale;

    return MaterialApp.router(
      locale: locale,
      routerConfig: appRouter.config(navigatorObservers: () {
        return [
          TalkerRouteObserver(GetIt.I<Talker>()),
          HeroController(),
        ];
      }, deepLinkBuilder: (deepLink) {
        if (deepLink.path.startsWith('/home')) {
          return deepLink;
        } else {
          return DeepLink.defaultPath;
        }
      }),
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      builder: DevicePreview.appBuilder,
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      darkTheme: null,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
