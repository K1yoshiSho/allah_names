import 'dart:async';

import 'package:allah_names/src/common/utils/utils.dart';
import 'package:allah_names/src/services/provider/locale_provider.dart';
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AllahApp extends StatefulWidget with WidgetsBindingObserver {
  const AllahApp({super.key});

  @override
  State<AllahApp> createState() => _AllahAppState();
}

class _AllahAppState extends State<AllahApp> with WidgetsBindingObserver {
  late final GoRouter _router = createRouter();
  Timer? _timer;
  DateTime? _appPausedTime;

  String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';

  @override
  void initState() {
    super.initState();
    // startLoccation();
    WidgetsBinding.instance.addObserver(this);
  }

  void startLoccation() async {
    await BackgroundLocation.setAndroidNotification(
      title: 'Background service is running',
      message: 'Background location in progress',
      icon: '@mipmap/ic_launcher',
    );
    //await BackgroundLocation.setAndroidConfiguration(1000);
    await BackgroundLocation.startLocationService(distanceFilter: 20);
    BackgroundLocation.getLocationUpdates((location) {
      setState(() {
        latitude = location.latitude.toString();
        longitude = location.longitude.toString();
        accuracy = location.accuracy.toString();
        altitude = location.altitude.toString();
        bearing = location.bearing.toString();
        speed = location.speed.toString();
        time = DateTime.fromMillisecondsSinceEpoch(location.time!.toInt()).toString();
      });
    });
  }

  // void getCurrentLocation() {
  //   BackgroundLocation().getCurrentLocation().then((location) {
  //     print('This is current Location ' + location.toMap().toString());
  //   });
  // }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // BackgroundLocation.stopLocationService();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _startTimer();
    } else if (state == AppLifecycleState.resumed) {
      _stopTimer();
    }
  }

  void _startTimer() {
    _appPausedTime = DateTime.now();
    _timer = Timer(const Duration(minutes: 3), () {
      DateTime now = DateTime.now();
      if (now.difference(_appPausedTime!) >= const Duration(minutes: 3)) {}
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    _appPausedTime = null;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleNotifier>(context).getLocale;

    return MaterialApp.router(
      title: "Workspace",
      locale: locale,
      routerConfig: _router,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
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
