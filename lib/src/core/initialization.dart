import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/core/firebase_options.dart';
import 'package:setram/src/core/local_notifications.dart';
import 'package:setram/src/core/notifications/notifications_service.dart';

Future<void> initOnLaunch() async {
  final loggedIn = await isLoggedIn();

  if (!loggedIn) return;

  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

  final token = await FirebaseMessaging.instance.getToken();

  await registerDeviceForNotifications(token!);

  await LocalNotifications.init();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (message.notification != null && message.notification?.android != null) {
      await LocalNotifications.show(
        LocalNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
        ),
      );
    }
  });
}

Future<void> initOnBuild() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await _registerBackendJobs();
}

Future<void> _registerBackendJobs() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");

  if (message.notification != null && message.notification?.android != null) {
    await LocalNotifications.show(
      LocalNotification(
        title: message.notification!.title!,
        body: message.notification!.body!,
      ),
    );
  }
}
