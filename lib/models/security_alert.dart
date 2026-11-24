enum AlertStatus { open, resolved }

class SecurityAlert {
  final String id;
  final String appId;
  final String threatType;
  final String severity;
  final String? deviceModel;
  final String? osVersion;
  final int reportedAt;
  final AlertStatus status;

  SecurityAlert({
    required this.id,
    required this.appId,
    required this.threatType,
    required this.severity,
    required this.deviceModel,
    required this.osVersion,
    required this.reportedAt,
    required this.status,
  });

  factory SecurityAlert.fromJson(Map<String, dynamic> json) {
    final rawSeverity = json['severity']?.toString().toLowerCase() ?? '';
    final severity = switch (rawSeverity) {
      'high' => 'High',
      'medium' => 'Medium',
      'low' => 'Low',
      _ => 'Low',
    };

    final rawStatus = json['status']?.toString().toLowerCase() ?? '';
    final status = rawStatus == 'resolved'
        ? AlertStatus.resolved
        : AlertStatus.open;

    return SecurityAlert(
      id: json['id']?.toString() ?? '',
      appId: json['appId']?.toString() ?? '',
      threatType: json['threatType']?.toString().isNotEmpty == true
          ? json['threatType'].toString()
          : 'Unknown',
      severity: severity,
      deviceModel: (json['deviceModel']?.toString().trim().isNotEmpty == true)
          ? json['deviceModel'].toString().trim()
          : null,
      osVersion: (json['osVersion']?.toString().trim().isNotEmpty == true)
          ? json['osVersion'].toString().trim()
          : null,
      reportedAt: json['reportedAt'] is int
          ? json['reportedAt'] as int
          : int.tryParse(json['reportedAt']?.toString() ?? '') ?? 0,
      status: status,
    );
  }

  SecurityAlert copyWith({AlertStatus? status}) {
    return SecurityAlert(
      id: id,
      appId: appId,
      threatType: threatType,
      severity: severity,
      deviceModel: deviceModel,
      osVersion: osVersion,
      reportedAt: reportedAt,
      status: status ?? this.status,
    );
  }
}
