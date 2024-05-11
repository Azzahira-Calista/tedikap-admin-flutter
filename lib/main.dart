import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/router/pages.dart';
import 'package:tedikap_admin/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppPages.INITIAL,
      // getPages: [
      //   GetPage(name: '/home', page: () => HomePage()),
      //   GetPage(name: '/menu', page: () => MenuPage())
      // ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
