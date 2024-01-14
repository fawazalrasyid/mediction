import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mediction/app/core/values/app_colors.dart';
import 'package:mediction/app/core/values/app_values.dart';
import 'package:mediction/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gradientPageBackground,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xFF18BEFD).withOpacity(0.2),
              const Color(0x662DECF9).withOpacity(0.0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppValues.padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/mediction_wordmark_logo.png",
                        height: 26,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.notification,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  // height: 200,
                  width: Get.width,
                  // padding: const EdgeInsets.all(AppValues.padding),
                  decoration: const BoxDecoration(
                    // color: Color(0xD81EB4EB),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/blue_ornament_background.png",
                      ),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Halo, ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Nisrina Thifal!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Apa kabar hari ini?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 34,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                              right: index == 3 ? 20 : 8,
                            ),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF83DAFE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10000,
                                ),
                              ),
                            ),
                            child: Text(
                              controller.feelings[index],
                              style: const TextStyle(
                                color: Color(0xFF003778),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin,
                        ),
                        padding: const EdgeInsets.all(AppValues.padding),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/first_aid_kit.png",
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Kontrol kesehatan ',
                                      style: TextStyle(
                                        color: Color(0xFF238CE6),
                                        fontSize: 14,
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'secara berkala bahkan bisa sendiri.',
                                      style: TextStyle(
                                        color: Color(0xFF0E132E),
                                        fontSize: 14,
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.SMART_CAMERA),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFDDFEFD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                ),
                                child: const Text(
                                  'Cek',
                                  style: TextStyle(
                                    color: Color(0xFF0F5896),
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: Get.width,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppValues.padding,
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pengingat Harian',
                                        style: TextStyle(
                                          color: Color(0xFF18255A),
                                          fontSize: 18,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Lihat Semua',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF238CE6),
                                          fontSize: 14,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Hari Ini, 14 Januari 2024',
                                    style: TextStyle(
                                      color: Color(0xFF848FAC),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: 1,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: EdgeInsets.only(
                                    left: index == 0 ? 20 : 0,
                                    right: index == 3 ? 20 : 8,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                        color: Color(0xFFDFF1FF),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    // shadows: const [
                                    //   BoxShadow(
                                    //     color: Color(0x26C5D0E6),
                                    //     blurRadius: 16,
                                    //     offset: Offset(0, 8),
                                    //     spreadRadius: 0,
                                    //   )
                                    // ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/rapid_test.png",
                                        height: 48,
                                        width: 48,
                                      ),
                                      const SizedBox(width: 12),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '09.00',
                                            style: TextStyle(
                                              color: Color(0xFF238CE6),
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Kontrol Hepatitis',
                                            style: TextStyle(
                                              color: Color(0xFF0E132E),
                                              fontSize: 14,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Rs. Soetomo Merdeka Raya',
                                            style: TextStyle(
                                              color: Color(0xFF606D93),
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppValues.margin,
                              ),
                              child: GridView.builder(
                                itemCount: 2,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 19 / 25,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(Routes.HEALTH_ANALYSIS),
                                  child: Container(
                                    width: Get.width * 0.44,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 20,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFF1F6FB),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          controller.menuImages[index],
                                          height: 56,
                                          width: 56,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          controller.menuNames[index],
                                          style: const TextStyle(
                                            color: Color(0xFF003778),
                                            fontSize: 16,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          controller.menuDescrptions[index],
                                          style: const TextStyle(
                                            color: Color(0xFF606D93),
                                            fontSize: 12,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.menuActions[index],
                                              style: const TextStyle(
                                                color: Color(0xFF238CE6),
                                                fontSize: 12,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: const ShapeDecoration(
                                                shape: OvalBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside,
                                                    color: Color(0xFF238CE6),
                                                  ),
                                                ),
                                              ),
                                              child: const Icon(
                                                IconlyBold.arrow_right_circle,
                                                size: 32,
                                                color: Color(0xFF003778),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
