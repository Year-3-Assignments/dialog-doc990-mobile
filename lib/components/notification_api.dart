import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationAPI {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String>();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
        icon: '@mipmap/logo',
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/logo');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {});
  }

  static Future showNotification({
    int id = 0,
    String title,
    String body,
    String payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
}
