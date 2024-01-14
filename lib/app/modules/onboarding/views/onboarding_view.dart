import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:mediction/app/core/values/app_values.dart';
import 'package:mediction/app/routes/app_pages.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Image.asset(
            'assets/images/onboarding.png',
            width: Get.width,
            height: Get.height * 0.55,
            fit: BoxFit.cover,
          ),
          Container(
            height: Get.height * 0.5,
            width: Get.width,
            margin: EdgeInsets.only(
              top: Get.height * 0.5,
            ),
            padding: const EdgeInsets.all(AppValues.padding),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Kami adalah Partner Sehatmu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF080814),
                    fontSize: 24,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Kesehatanmu adalah prioritas, pantau dan kontrol dengan mudah bersama kami.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF52525B),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 64),
                SizedBox(
                  width: Get.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () => Get.offNamed(Routes.LOGIN),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Mulai Sekarang",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFF238CE6),
                              ),
                            ),
                          ),
                          child: const Icon(
                            IconlyBold.arrow_right_circle,
                            size: 32,
                            color: Color(0xFF238CE6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
