import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediction/app/routes/app_pages.dart';

import '../controllers/register_success_controller.dart';

class RegisterSuccessView extends GetView<RegisterSuccessController> {
  const RegisterSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => Get.offAllNamed(Routes.LOGIN),
          child: SizedBox(
            width: Get.width,
            child: Image.asset(
              "assets/images/register_success.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
