# flutter_notification_channel
https://pub.dev/packages/flutter_notification_channel

This plugin is made to register notification channels with custom configurations on Android. For more details read this https://developer.android.com/training/notify-user/channels
Why is it necessary? E.g. firebase_messaging version 7.0.3 (current) and lower do not allow to set up a notification channel, thus notifications don't play any sounds or do not display on locked screen, or don't bubble and so on. This plugin is made merely for the purpose of creation a notification channel with custom configurations on Android. The channels then can be used along with firebase_messaging. 

## How to use

Simply call it like this

```dart
var result = await FlutterNotificationChannel.registerNotificationChannel(
    description: 'Your channel description',
    id: 'your_channel_id',
    importance: NotificationImportance.IMPORTANCE_HIGH,
    name: 'Your channel name',
    visibility: NotificationVisibility.VISIBILITY_PUBLIC,
    allowBubbles: true,
    enableVibration: true,
    enableSound: true,
);
print(result);
```



