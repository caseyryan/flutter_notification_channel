import 'package:flutter/material.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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
            children: [
              FlatButton(
                onPressed: () async {
                  print('start registering');
                  var result = await FlutterNotificationChannel
                      .registerNotificationChannel(
                          description: 'My test channel',
                          id: 'com.softmaestri.testchannel',
                          importance: NotificationImportance.IMPORTANCE_HIGH,
                          name: 'Flutter channel test name');
                  print('Result: $result');
                },
                child: Text('Register channel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
