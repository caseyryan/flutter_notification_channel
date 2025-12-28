import 'package:flutter/material.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register Channel'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () async {
                  debugPrint('start registering high importance');
                  var result = await FlutterNotificationChannel()
                      .registerNotificationChannel(
                    description: 'My test channel with high importance',
                    id: 'com.softmaestri.testchannel.high',
                    importance: NotificationImportance.IMPORTANCE_HIGH,
                    name: 'Flutter channel test (High)',
                  );
                  debugPrint('Result: $result');
                },
                child: const Text('Register High Importance Channel'),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  debugPrint('start registering max importance');
                  var result = await FlutterNotificationChannel()
                      .registerNotificationChannel(
                    description: 'Critical notifications with maximum importance',
                    id: 'com.softmaestri.testchannel.max',
                    importance: NotificationImportance.IMPORTANCE_MAX,
                    name: 'Flutter channel test (MAX)',
                    enableSound: true,
                    enableVibration: true,
                    allowBubbles: true,
                  );
                  debugPrint('Result: $result');
                },
                child: const Text('Register MAX Importance Channel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
