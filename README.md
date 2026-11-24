# Security Alerts Dashboard

A Flutter Web dashboard for reviewing mobile-app security alerts. It reads the supplied JSON asset, shows dashboard counts, lets you filter and sort alerts, and supports resolving an open alert during the current app session.

## How to run

Use Flutter stable and Google Chrome. From the project folder, run:

```powershell
flutter --version
flutter pub get
flutter run -d chrome
```

To check the code, run:

```powershell
flutter analyze
```

Before submitting, paste the complete output of `flutter --version` here and confirm that `flutter analyze` reports `No issues found!`. The code has not been run in this chat, so those results must be verified on your machine.

## Project structure

- `assets/alerts.json` — the supplied alert and app data; keep this file unchanged.
- `pubspec.yaml` — Flutter package configuration and declaration of the JSON asset.
- `lib/main.dart` — application startup, theme, provider setup, and navigation routes.
- `lib/models/app_info.dart` — app model and display name including platform.
- `lib/models/security_alert.dart` — alert model and defensive parsing of optional data.
- `lib/data/alert_repository.dart` — delayed JSON asset loading and simulated load error.
- `lib/data/threat_names.dart` — one mapping from threat codes to readable names.
- `lib/providers/alert_provider.dart` — shared app/alert state, counts, and resolve updates.
- `lib/screens/dashboard_screen.dart` — summary cards and app list.
- `lib/screens/alerts_screen.dart` — alert filters, sorting, and five-alert pagination.
- `lib/screens/detail_screen.dart` — alert fields and resolve confirmation.
- `lib/widgets/app_shell.dart` — shared page header and navigation.
- `lib/widgets/loading_or_error.dart` — loading indicator, error message, and retry button.
- `lib/widgets/severity_chip.dart` — reusable severity chip.

## What works and what does not

Implemented: dashboard totals and per-app open counts, app-specific navigation, alert filters, severity sorting, pagination, detail pages, local-time display, and resolving an alert with confirmation. Data loads from the JSON asset after a delay; the repository also has a `simulateError` switch for testing the retry UI.

Alert resolution is kept in memory and will reset when the app is reloaded. This project still needs to be run locally: verify the screens in Chrome at narrow and wide widths, run `flutter analyze`, and fix any issues before submitting. The required screen recording and a verified Flutter version are not included yet.

## How AI helped

- Tools I used: GitHub Copilot.
- Two prompts I used (paste them as you typed them): “making project like Frontend Developer Intern Task (Flutter)” and “ok fast create simple ui”.
- One thing the AI got wrong, and how I found and fixed it: An early project update added the manifest and data classes but left out `lib/main.dart` and the screens. I checked the repository file list, found those missing files, and added the app entry point and screen files afterward. Please verify the current branch and run the app to confirm.
- One part I wrote or changed myself without AI: Before submission, replace this line with a specific change you personally made and can explain in the interview. Do not claim a change you did not make.

## Questions

1. Where does your app keep the list of alerts, and how does the Dashboard find out that an alert was resolved? The `AlertProvider` keeps the loaded alerts in memory. Resolving an alert updates its status and calls `notifyListeners()`, so the Dashboard and Alerts screen rebuild with the new state.
2. What would you change to load alerts from a real API instead of the JSON file? I would replace the asset read in `AlertRepository` with an HTTP request, parse and validate the response into the same models, and handle network failures there. The screens could continue reading state through the provider.

## Video

Screen recording: **TODO — add a shareable Google Drive or unlisted YouTube link after recording the required walkthrough.**
