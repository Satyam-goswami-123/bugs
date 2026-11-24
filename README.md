# Security Alerts Dashboard

A simple Flutter Web dashboard for viewing mobile-app security alerts. It reads the supplied JSON file and lets users view counts, filter alerts, open details, and resolve an alert.

## How to run

From the project folder, run:

```powershell
flutter --version
flutter pub get
flutter run -d chrome
```

Check the code with:

```powershell
flutter analyze
```

Paste your complete `flutter --version` output below before submission:

```text
Paste Flutter version output here
```

The analyzer should report:

```text
No issues found!
```

## Project structure

- `assets/alerts.json` - supplied app and alert data.
- `pubspec.yaml` - packages and JSON asset configuration.
- `lib/main.dart` - app startup, theme, Provider, and routes.
- `lib/models/` - app and alert data classes.
- `lib/data/alert_repository.dart` - loads JSON after a one-second delay.
- `lib/data/threat_names.dart` - maps threat codes to readable names.
- `lib/providers/alert_provider.dart` - stores alerts and updates dashboard counts.
- `lib/screens/dashboard_screen.dart` - summary cards and app list.
- `lib/screens/alerts_screen.dart` - filters, sorting, and five-alert pagination.
- `lib/screens/detail_screen.dart` - all alert fields and resolve confirmation.
- `lib/widgets/severity_chip.dart` - reusable colored severity label.
- `lib/widgets/loading_or_error.dart` - loading, error, and Retry UI.
- `lib/widgets/app_shell.dart` - shared header and navigation.
- `README.md` - setup and project explanation.

## What works and what does not

Implemented: dashboard counts, app-specific navigation, app/severity/status filters, severity sorting, pagination, detail pages, local-time dates, and resolving open alerts with confirmation.

Run the project in Chrome and test narrow and wide widths. Resolving an alert changes in-memory state only; a browser reload returns the original JSON data. Replace the personal contribution placeholder and paste the real Flutter version before submission.

## How AI helped

- Tools I used: GitHub Copilot.
- Two prompts I used:
  1. `making project like Frontend Developer Intern Task (Flutter)`
  2. `ok fast create simple ui`
- One thing the AI got wrong, and how I found and fixed it: An early update added the data files but missed `lib/main.dart` and screen files. I checked the repository file list, found the missing files, and added them.
- One part I wrote or changed myself without AI: Before submission, replace this line with one real change you made yourself and explain it in the interview.

## Questions

1. Where does your app keep the list of alerts, and how does the Dashboard find out that an alert was resolved?

   The `AlertProvider` keeps the alerts in memory. Resolving an alert changes its status and calls `notifyListeners()`. The Dashboard and Alerts screens rebuild using the new state.

2. What would you change to load alerts from a real API instead of the JSON file?

   I would replace the asset read in `AlertRepository` with an HTTP request. The response would be parsed into the existing models. I would also add authentication, timeout, loading, and network-error handling.

## Video

https://www.youtube.com/watch?v=satyamgoswami129
