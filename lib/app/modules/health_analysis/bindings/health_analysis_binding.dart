import 'package:get/get.dart';

import '../controllers/health_analysis_controller.dart';

class HealthAnalysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthAnalysisController>(
      () => HealthAnalysisController(),
    );
  }
}
