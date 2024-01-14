import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/values/app_colors.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mediction",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: AppColors.colorPrimary,
        primarySwatch: AppColors.colorPrimarySwatch,
        scaffoldBackgroundColor: AppColors.pageBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
    ),
  );
}
