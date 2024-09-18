import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: "basic_group_channel",
        channelKey: "basic_channel",
        channelName: "Basic Channel",
        channelDescription: "Test Notification")
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "basic_group_channel",
        channelGroupName: "Basic Group Channel")
  ]);
  bool isAllowedToSendNotifications =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotifications) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'لا تحزن',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
