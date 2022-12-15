// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:tez_taxi/core/injection/configurator.dart';
// import 'package:tez_taxi/core/shared/firebase_client.dart';
// import 'package:tez_taxi/feature/global/global_order/global_order_workflow/puhser_workflow/pusher_beams_workflow.dart';
// import 'package:tez_taxi/firebase_options.dart';

// class FirebaseClientImpl implements FirebaseClient {
//   @override
//   Future<void> init() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );

//     FirebaseMessaging _messaging = FirebaseMessaging.instance;

//     if (Platform.isIOS) {
//       requestPermissionToNotifications(_messaging);
//     }

//     // init pusher beams
//     await initPusherBeams();

//     // initialize crashlytics
//     initCrashlytics();
//   }

//   @override
//   void initCrashlytics() {
//     FlutterError.onError = (errorDetails) {
//       FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     };

//     // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//     PlatformDispatcher.instance.onError = (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       return true;
//     };
//   }

//   @override
//   Future<void> requestPermissionToNotifications(
//       FirebaseMessaging messaging) async {
//     final NotificationSettings settings = await messaging.requestPermission();

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('User granted permission');
//       }
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         print('User granted provisional permission');
//       }
//     } else {
//       if (kDebugMode) {
//         print('User declined or has not accepted permission');
//       }
//     }
//   }

//   @override
//   Future<void> initPusherBeams() async {
//     final pusherBeams = getIt<PusherBeamsWorkflow>();
//     await pusherBeams.init();
//   }
// }
