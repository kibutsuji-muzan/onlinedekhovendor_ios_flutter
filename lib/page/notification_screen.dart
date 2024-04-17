import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/page/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const route = '/notification_screen';

  @override
  Widget build(BuildContext context) {
     final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

     final notificationTitle = message?.notification?.title ?? 'No Title';
    final notificationBody = message?.notification?.body ?? 'No Body';
    final messageData = message?.data ?? 'No Data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$notificationTitle'),
            Text('$notificationBody'),
            Text('$messageData'),
          ],
        ),
      ),
    );
  }
}
