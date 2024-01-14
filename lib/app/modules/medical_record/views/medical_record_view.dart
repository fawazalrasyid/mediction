import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediction/app/routes/app_pages.dart';

import '../controllers/medical_record_controller.dart';

class MedicalRecordView extends GetView<MedicalRecordController> {
  const MedicalRecordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.DETAIL_MEDICAL_RECORD),
          child: SizedBox(
            width: Get.width,
            child: Image.asset(
              "assets/images/medical_record.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
