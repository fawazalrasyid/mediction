import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediction/app/routes/app_pages.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => Get.back(),
          child: SizedBox(
            width: Get.width,
            child: Image.asset(
              "assets/images/schedule.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_SCHEDULE),
        backgroundColor: const Color(0xFF003778),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
