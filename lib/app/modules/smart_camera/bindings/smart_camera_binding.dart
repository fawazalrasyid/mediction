import 'package:get/get.dart';

import '../controllers/smart_camera_controller.dart';

class SmartCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmartCameraController>(
      () => SmartCameraController(),
    );
  }
}
