# flutter_notification_channel

This plugin is made to register custom notification channels on Android.
Why is it necessary? E.g. flutter firebase_messaging version 7.0.3 (current) and 
lower do not allow registering a custom channel for notification, 
thus notifications don't play any sounds. This plugin is 
made merely for the purpose of creation a notification channel with 
difference importance. The channel then can be used in firebase

## How to use

Simply call it like this

```dart
var result = await FlutterNotificationChannel.registerNotificationChannel(
    description: 'Your channel description',
    id: 'your_channel_id',
    importance: NotificationImportance.IMPORTANCE_HIGH,
    name: 'Your channel name'
);
print(result);
```


