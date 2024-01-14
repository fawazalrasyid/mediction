import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/form_item.dart';
import '../../../core/widgets/labeled_checkbox.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width * 0.2,
                          child:
                              Image.asset('assets/images/mediction_logo.png'),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Selamat datang!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF080814),
                            fontSize: 24,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Silahkan masuk dengan data yang terdaftar.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF52525B),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 40),
                        FormItem(
                          controller: controller.emailCtrl,
                          validator: controller.checkIsValidForm,
                          label: "ID Pasien",
                          hintLabel: "Tulis id pasien",
                          inputType: TextInputType.name,
                          isRequired: true,
                        ),
                        const SizedBox(height: 20),
                        FormItem(
                          controller: controller.passwordCtrl,
                          obsecureText: controller.obscurePassword,
                          validator: controller.checkIsValidForm,
                          label: "Kata sandi",
                          hintLabel: "Tulis kata sandi anda",
                          inputType: TextInputType.visiblePassword,
                          isRequired: true,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabeledCheckbox(
                              label: "Ingat Saya",
                              value: controller.chechkbox.value,
                              onChanged: (bool newValue) {
                                controller.chechkbox.value = newValue;
                              },
                            ),
                            const Text(
                              "Lupa Password",
                              style: TextStyle(
                                color: Color(0xFF3C8FE5),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 42),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: controller.isValidForm.value
                                ? () => controller.login()
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.colorPrimary,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.fromLTRB(64, 16, 64, 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: controller.isLoading.value
                                ? const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    "Masuk",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.REGISTER),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Belum punya akun? ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF64748B),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Daftar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3C8FE5),
                                  fontSize: 13,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
