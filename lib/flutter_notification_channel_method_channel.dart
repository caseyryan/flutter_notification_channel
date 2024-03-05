import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notification_channel/notification_visibility.dart';

import 'flutter_notification_channel_platform_interface.dart';

/// An implementation of [FlutterNotificationChannelPlatform] that uses method channels.
class MethodChannelFlutterNotificationChannel
    extends FlutterNotificationChannelPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_notification_channel');

  Future<String> registerNotificationChannel({
    required String id,
    required String name,
    required String description,
    required int importance,
    int visibility = NotificationVisibility.VISIBILITY_PUBLIC,
    bool allowBubbles = true,
    bool enableVibration = true,
    bool enableSound = true,
    bool showBadge = true,
    String? customSound,
  }) async {
    assert(visibility >= NotificationVisibility.VISIBILITY_SECRET &&
        visibility <= NotificationVisibility.VISIBILITY_PUBLIC);
    var params = {
      'id': id,
      'name': name,
      'description': description,
      'importance': importance,
      'visibility': visibility,
      'enableVibration': enableVibration,
      'allowBubbles': allowBubbles,
      'enableSound': enableSound,
      'showBadge': showBadge,
      'customSound': customSound,
    };
    String response = (await methodChannel.invokeMethod<String>(
          'registerNotificationChannel',
          params,
        )) ??
        'error';
    return response;
  }
}
