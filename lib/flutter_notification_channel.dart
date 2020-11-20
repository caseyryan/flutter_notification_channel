import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterNotificationChannel {
  static const MethodChannel _channel =
      const MethodChannel('flutter_notification_channel');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

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
  static Future<String> registerNotificationChannel({
    @required String id,
    @required String name,
    @required String description,
    @required int importance,
  }) async {
    assert(id != null);
    assert(name != null);
    assert(description != null);
    assert(importance != null);
    var params = {
      'id': id,
      'name': name ?? '',
      'description': description ?? '',
      'importance': importance,
    };
    String response = await _channel.invokeMethod(
      'registerNotificationChannel',
      params,
    );
    return response;
  }
}
