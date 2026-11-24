class AppInfo {
  final String id;
  final String name;
  final String platform;

  AppInfo({required this.id, required this.name, required this.platform});

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      id: (json['id']?.toString() ?? ''),
      name: (json['name']?.toString().trim().isNotEmpty == true)
          ? json['name'].toString().trim()
          : 'Unknown',
      platform: (json['platform']?.toString().toLowerCase() == 'ios')
          ? 'iOS'
          : 'Android',
    );
  }

  String get displayName => '$name ($platform)';
}
