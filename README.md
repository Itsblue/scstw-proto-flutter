<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->
# SCSTW Library

This package provides functionality for managing race states, lane states, and UI interactions in a training or competition environment. It is designed to handle complex race scenarios, including lane-specific actions, race state changes, and UI updates.

## Features

- **Race State Management**: Handle race states such as `FINISHED`, `RUNNING`, `DISABLED`, and more.
- **Lane State Management**: Manage lane-specific actions like enabling/disabling lanes, handling falls, and computing available actions.
- **UI Updates**: Dynamically update UI elements such as lane text, colors, and subtext based on race and lane states.
- **Command Execution**: Send commands to control race and lane states, including enabling/disabling lanes and handling race finishes.
- **Autostart Progress Handling**: Manage autostart progress based on race settings.

## Getting Started

### Prerequisites

- Dart SDK
- Flutter framework (if used in a Flutter project)

### Installation

Run the following command to add the `scstw_lib` package to your project:

```bash
flutter pub add scstw_lib
```

### Usage

```dart
_uiStateController = UIStateController(_connection);

_uiStateSubscription = _uiStateController.uiStateStream.listen((event) {
  setState(() {
    _uiState = event;
  });
});
```

