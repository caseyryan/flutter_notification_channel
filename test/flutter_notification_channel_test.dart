import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/flutter_notification_channel_platform_interface.dart';
import 'package:flutter_notification_channel/flutter_notification_channel_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNotificationChannelPlatform
    with MockPlatformInterfaceMixin
    implements FlutterNotificationChannelPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNotificationChannelPlatform initialPlatform = FlutterNotificationChannelPlatform.instance;

  test('$MethodChannelFlutterNotificationChannel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNotificationChannel>());
  });

  test('getPlatformVersion', () async {
    FlutterNotificationChannel flutterNotificationChannelPlugin = FlutterNotificationChannel();
    MockFlutterNotificationChannelPlatform fakePlatform = MockFlutterNotificationChannelPlatform();
    FlutterNotificationChannelPlatform.instance = fakePlatform;

    expect(await flutterNotificationChannelPlugin.getPlatformVersion(), '42');
  });
}
