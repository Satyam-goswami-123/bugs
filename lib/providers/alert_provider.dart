import 'package:flutter/foundation.dart';

import '../data/alert_repository.dart';
import '../models/app_info.dart';
import '../models/security_alert.dart';

class AlertProvider extends ChangeNotifier {
  final AlertRepository repository;

  AlertProvider({required this.repository});

  List<AppInfo> apps = [];
  List<SecurityAlert> alerts = [];
  bool isLoading = false;
  String? error;

  Future<void> load() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      apps = await repository.loadApps();
      alerts = await repository.loadAlerts();
    } catch (errorValue) {
      error = 'Unable to load security alerts. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  int get totalAlerts => alerts.length;
  int get openAlerts => alerts.where((alert) => alert.status == AlertStatus.open).length;
  int get highOpenAlerts => alerts.where((alert) =>
      alert.status == AlertStatus.open && alert.severity == 'High').length;

  int openAlertsForApp(String appId) => alerts.where((alert) =>
      alert.appId == appId && alert.status == AlertStatus.open).length;

  AppInfo? appById(String appId) {
    for (final app in apps) {
      if (app.id == appId) return app;
    }
    return null;
  }

  SecurityAlert? alertById(String alertId) {
    for (final alert in alerts) {
      if (alert.id == alertId) return alert;
    }
    return null;
  }

  void resolveAlert(String alertId) {
    alerts = alerts.map((alert) {
      return alert.id == alertId
          ? alert.copyWith(status: AlertStatus.resolved)
          : alert;
    }).toList();
    notifyListeners();
  }
}
