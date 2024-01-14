import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/smart_camera_controller.dart';

class SmartCameraView extends GetView<SmartCameraController> {
  const SmartCameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.isInitializeCamera.value
            ? Stack(
                children: [
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: controller.objectImage.value == null
                        ? CameraPreview(controller.cameraCtrl!)
                        : Image.file(
                            File(controller.objectImage.value!.path),
                            fit: BoxFit.cover,
                          ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Can't connect to the camera"),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () => controller.loadCamera(),
                      child: const Text(
                        "Try again!",
                        style: TextStyle(
                          color: Color(0xff003778),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
