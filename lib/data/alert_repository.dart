import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/app_info.dart';
import '../models/security_alert.dart';

const bool simulateError = false;

class AlertRepository {
  Future<List<AppInfo>> loadApps() async {
    return (await _loadData()).apps;
  }

  Future<List<SecurityAlert>> loadAlerts() async {
    return (await _loadData()).alerts;
  }

  Future<({List<AppInfo> apps, List<SecurityAlert> alerts})> _loadData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (simulateError) {
      throw Exception('Unable to load security alerts');
    }

    final String jsonText = await rootBundle.loadString('assets/alerts.json');
    final Map<String, dynamic> json =
        jsonDecode(jsonText) as Map<String, dynamic>;

    final apps = (json['apps'] as List<dynamic>? ?? const <dynamic>[])
        .map((item) => AppInfo.fromJson(item as Map<String, dynamic>))
        .toList();
    final alerts = (json['alerts'] as List<dynamic>? ?? const <dynamic>[])
        .map((item) => SecurityAlert.fromJson(item as Map<String, dynamic>))
        .toList();

    return (apps: apps, alerts: alerts);
  }
}
