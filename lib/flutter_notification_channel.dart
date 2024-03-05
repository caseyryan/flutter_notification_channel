import 'package:flutter_notification_channel/notification_visibility.dart';

import 'flutter_notification_channel_platform_interface.dart';

class FlutterNotificationChannel {
  /// [id] The id of the channel. Must be unique per package.
  /// The value may be truncated if it is too long
  /// [name] The user visible name of the channel.
  /// The recommended maximum length is 40 characters; the value may be
  /// truncated if it is too long
  /// [description] Sets the user visible description of this channel.
  /// The recommended maximum length is 300 characters;
  /// the value may be truncated if it is too long
  /// [importance] The importance of the channel.
  /// This controls how interruptive notifications posted to this channel are
  /// it is one of the constants from NotificationImportance class
  /// [visibility]Sets whether notifications posted to this channel appear on the lockscreen or not, and if so,
  /// whether they appear in a redacted form. See e.g.
  /// Only modifiable by the system and notification ranker
  /// [allowBubble] IMPORTANT! Will take effect only on sdk version 29+
  /// and will be silently ignored on any prior versions
  /// Sets whether notifications posted to this
  /// channel can appear outside of the notification
  /// shade, floating over other apps' content as a bubble.
  /// <p>This value will be ignored for channels that aren't allowed to pop on screen (that is,
  /// channels whose {@link #getImportance() importance} is <
  /// {@link NotificationManager#IMPORTANCE_HIGH}.</p>
  /// <p>Only modifiable before the channel is submitted to
  /// {@link NotificationManager#createNotificationChannel(NotificationChannel)}.</p>
  /// @see Notification#getBubbleMetadata()
  /// [enableVibration] Sets whether notification posted to
  /// this channel should vibrate
  /// [enableSound] whether this notification should play a sound
  /// if you pass "sound": "default" when sending a notification
  /// [showBadge] Sets whether notifications posted to this channel
  /// can appear as application icon badges in a Launcher
  /// [customSound] optional name of sound resource (located in android/src/main/res/raw)
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
  }) =>
      FlutterNotificationChannelPlatform.instance.registerNotificationChannel(
        id: id,
        name: name,
        description: description,
        importance: importance,
        visibility: visibility,
        allowBubbles: allowBubbles,
        enableVibration: enableVibration,
        enableSound: enableSound,
        showBadge: showBadge,
        customSound: customSound,
      );
}
