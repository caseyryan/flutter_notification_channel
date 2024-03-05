import 'package:flutter_notification_channel/notification_visibility.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_notification_channel_method_channel.dart';

abstract class FlutterNotificationChannelPlatform extends PlatformInterface {
  /// Constructs a FlutterNotificationChannelPlatform.
  FlutterNotificationChannelPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNotificationChannelPlatform _instance =
      MethodChannelFlutterNotificationChannel();

  /// The default instance of [FlutterNotificationChannelPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNotificationChannel].
  static FlutterNotificationChannelPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNotificationChannelPlatform] when
  /// they register themselves.
  static set instance(FlutterNotificationChannelPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

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
  }) {
    throw UnimplementedError(
        'registerNotificationChannel() has not been implemented.');
  }
}
