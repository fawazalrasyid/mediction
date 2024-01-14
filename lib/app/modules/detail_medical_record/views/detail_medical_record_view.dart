import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_medical_record_controller.dart';

class DetailMedicalRecordView extends GetView<DetailMedicalRecordController> {
  const DetailMedicalRecordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => Get.back(),
          child: SizedBox(
            width: Get.width,
            child: Image.asset(
              "assets/images/detail_medical_record.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
