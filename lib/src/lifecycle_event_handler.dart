import 'dart:ui';

import 'package:flutter/widgets.dart';

/// A class that helps to handle app lifecycle events.
class LifecycleEventHandler extends WidgetsBindingObserver {
  /// The constructor.
  LifecycleEventHandler({
    required this.onResumed,
    required this.onPaused,
  });

  /// A callback that is called when the app is resumed.
  final VoidCallback onResumed;

  /// A callback that is called when the app is paused.
  final VoidCallback onPaused;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden: // Add this line
        onPaused();
        break;
    }
  }
}
