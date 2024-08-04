import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/firebase/notification_service/notification_service.dart';
import 'package:tedikap_admin/routes/AppPages.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/firebase/global_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'tedikap-admin',
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      builder: (context, child) {
        final notificationService = NotificationService();
          notificationService.setupInteractMessage(context);
          notificationService.requestNotificationPermisions();
          notificationService.forgroundMessage();
          notificationService.firebaseInit(context);
          notificationService.getDeviceToken().then((value) {
            GlobalVariables.deviceToken = value;
            print('Device Token: ${GlobalVariables.deviceToken}');
          });
          return child!;
      },
    );
  }
}
