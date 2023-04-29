import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';

const maxEventNameLength = 40;
const maxParameterLength = 100;

void logFirebaseEvent(String eventName, {Map<String?, dynamic>? parameters}) {
  assert(eventName.length <= maxEventNameLength);

  parameters ??= {};
  parameters.removeWhere((k, v) => k == null || v == null);
  final params = parameters.map((k, v) => MapEntry(k!, v));

  for (final entry in params.entries) {
    if (entry.value is! num) {
      var valStr = entry.value.toString();
      if (valStr.length > maxParameterLength) {
        valStr = valStr.substring(0, min(valStr.length, maxParameterLength));
      }
      params[entry.key] = valStr;
    }
  }

  FirebaseAnalytics.instance.logEvent(name: eventName, parameters: params);
}
