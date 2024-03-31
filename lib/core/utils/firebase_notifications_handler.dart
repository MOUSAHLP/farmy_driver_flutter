// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   if (kDebugMode) {
//     print('notification(${notificationResponse.id}) action tapped: '
//         '${notificationResponse.actionId} with'
//         ' payload: ${notificationResponse.payload}');
//   }
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     if (kDebugMode) {
//       print(
//           'notification action tapped with input: ${notificationResponse.input}');
//     }
//   }
// }
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // await Firebase.initializeApp();
// }
//
// class FirebaseNotificationsHandler {
//   static final FirebaseNotificationsHandler _firebase =
//       FirebaseNotificationsHandler._internal();
//
//   factory FirebaseNotificationsHandler() {
//     return _firebase;
//   }
//
//   FirebaseNotificationsHandler._internal();
//
//   RemoteMessage? newMessage;
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<String?> refreshFcmToken() async {
//     String? currentToken = await _firebaseMessaging.getToken();
//     if (kDebugMode) print('FCM Token: $currentToken');
//     return currentToken;
//   }
//
//   Future<void> init() async {
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//     );
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     var android = const AndroidInitializationSettings(
//         '@drawable/ic_stat_ic_notification');
//     var ios = const DarwinInitializationSettings();
//     var platform = InitializationSettings(android: android, iOS: ios);
//     flutterLocalNotificationsPlugin.initialize(platform,
//         onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
//
//     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     _firebaseMessaging.requestPermission(sound: true, alert: true, badge: true);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (kDebugMode) {
//         print('OpenedApp');
//       }
//       // newMessage = message;
//
//       RemoteNotification? notification = message.notification;
//      // AndroidNotification? android = message.notification?.android;
//
//       if (notification != null) {
//         flutterLocalNotificationsPlugin
//             .show(
//                 notification.hashCode,
//                 notification.title,
//                 notification.body,
//                 NotificationDetails(
//                   android: AndroidNotificationDetails(
//                     channel.id,
//                     channel.name,
//                     // icon: android!.smallIcon,
//                     showWhen: true,
//
// //                    color: ColorManager.primaryColor,
//                   ),
//                 ))
//             .catchError((onError) {
//           if (kDebugMode) {
//             print("hello");
//             print(onError);
//           }
//         });
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       if (kDebugMode) {
//         print('background not terminated');
//       }
//       // processMessage(message);
//     });
//
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (kDebugMode) {
//         print("FirebaseMessaging.getInitialMessage");
//       }
//       if (message != null) {
//         // processMessage(message);
//       }
//     });
//
//     // for iOS only
//     _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//
//     _firebaseMessaging.getToken().then((token) {
//       if (kDebugMode) print('FCM Token: $token');
//       // _registerToken(token!);
//     });
//
//     // _firebaseMessaging.onTokenRefresh.listen(_registerToken);
//   }
//
//   // void _registerToken(String token) {
//   //   if (_requestToken) {
//   //     _requestToken = false;
//   //     ApiClient client = PaprikaApiClient();
//   //     NotificationsApi api = NotificationsApi(client);
//   //     api
//   //         .apiServicesAppNotificationsRegisterFirebaseNotificationsPost(
//   //             token: token)
//   //         .then((_) {
//   //       _requestToken = true;
//   //     }).catchError((error) {
//   //       _requestToken = true;
//   //     });
//   //   }
//   // }
//
//   // void processMessage(RemoteMessage? models) {
//   //   if (models == null) return;
//   //   final data = models.data["Model"];
//   //   int type;
//   //   try {
//   //     type = int.parse(models.data['NotificationName'] as String);
//   //   } catch (e) {
//   //     return;
//   //   }
//
//   //   switch (type) {
//   //     case NotificationType.reservationApprovedInt:
//   //       Get.to(ReservationsScreen());
//   //       break;
//
//   //     case NotificationType.newRestaurantAddedInt:
//   //       final int? restId =
//   //       (json.decode(data as String))["RestaurantId"] as int?;
//   //       if (restId != null && restId > 0) {
//   //         navigationController.toRestaurantScreen(restaurantId: restId);
//   //       }
//   //       break;
//   //   }
//   // }
//
//   // Future<dynamic> _onNotificationDialogClick(NotificationResponse? message) {
//   //   if (newMessage != null) {
//   //     // processMessage(newMessage);
//   //     return Future<dynamic>.value();
//   //   } else {
//   //     return Future<dynamic>.value();
//   //   }
//   // }
// }
