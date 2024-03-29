import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/health_analysis_controller.dart';

class HealthAnalysisView extends GetView<HealthAnalysisController> {
  const HealthAnalysisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthAnalysisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HealthAnalysisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
