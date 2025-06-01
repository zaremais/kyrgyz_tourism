// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:kyrgyz_tourism/main.dart';

// class FirebaseApi {
//   final messaging = FirebaseMessaging.instance;

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.max,
//   );

//   Future<void> initNotifications() async {
//     await messaging.requestPermission();
//     final fCMToken = await messaging.getToken();
//     log("Token: $fCMToken");
//     await initPushNotifications();
//   }

//   Future initPushNotifications() async {
//     final androidPlugin =
//         flutterLocalNotificationsPlugin
//             .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin
//             >();
//     if (androidPlugin != null) {
//       await androidPlugin.createNotificationChannel(channel);
//     }

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('notification');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (details) {},
//     );

//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final notification = message.notification;
//       final android = message.notification?.android;

//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,

//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               icon: 'notification',
//             ),
//           ),
//         );
//       }
//     });
//   }

//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     navigatorKey;
//   }
// }
