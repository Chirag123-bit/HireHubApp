import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import "package:get/get.dart";
import 'package:hirehub/models/Events.dart';
import 'package:hirehub/screens/misc/NotifyScreen.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    _configureLocalTimeZone();
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(const Text("Welcome"));
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future selectNotification(String? payload) async {
    if (payload == "Theme Changed") {
      return;
    }
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(() => NotifyScreen(label: payload));
  }

  displayNotification({required String title, required String body}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

  scheduledNotification(int hour, int minutes, Event event) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      event.id!.toInt(),
      event.title!,
      event.note!,
      _convertTime(hour, minutes),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              channelDescription: 'your channel description')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: event.title! + "|" + event.note! + "|",
    );
  }
}

tz.TZDateTime _convertTime(int hour, int minutes) {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduleDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
  if (scheduleDate.isBefore(now)) {
    scheduleDate = scheduleDate.add(const Duration(days: 1));
  }

  return scheduleDate;
}

Future<void> _configureLocalTimeZone() async {
  tzData.initializeTimeZones();
  final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation("Asia/Kathmandu"));
}
