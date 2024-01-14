import 'package:get/get.dart';

import '../controllers/detail_medical_record_controller.dart';

class DetailMedicalRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMedicalRecordController>(
      () => DetailMedicalRecordController(),
    );
  }
}
